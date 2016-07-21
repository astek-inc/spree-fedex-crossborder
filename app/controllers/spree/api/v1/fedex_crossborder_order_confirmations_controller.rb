module Spree
  module Api
    module V1
      class FedexCrossborderOrderConfirmationsController < Spree::Api::BaseController

        require 'base64'
        require 'nokogiri'

        def create
          unless valid_partner_key?
            puts "Invalid partner key: #{params[:partner_key]}"
            raise "Invalid partner key: #{params[:partner_key]}"
          end

          unless @xml = Base64.strict_decode64(params[:order])
            puts "Invalid XML: #{params[:order]}"
            raise "Invalid XML: #{params[:order]}"
          end
          @xml_doc = xml_doc

          unless @status = status
            puts "Invalid status: #{params[:status]}"
            raise "Invalid status: #{params[:status]}"
          end

          confirmation = {
              :order_id => order_id,
              :order_number => order_number,
              :status => @status,
              :data => @xml
          }

          Spree::FedexCrossborderOrderConfirmation.create confirmation

          # Products have been cancelled, i.e., removed from the order
          if @status == 'C'
            update_line_items
          end

          respond_to do |format|
            format.text { render text: '{SUCCESS}' }
          end

        end

        private

        # FedEx Crossborder sends a "token" param which is unrelated to Spree.
        # We need to ignore it. This overwrites the method found in the API base controller,
        # which for some reason attempts to validate a "token" param as an API key
        # even if authentication is not required.
        def authenticate_user
          return if @current_api_user

          if requires_authentication? && api_key.blank? && order_token.blank?
            render "spree/api/errors/must_specify_api_key", status: 401 and return
          elsif order_token.blank? && requires_authentication? # (requires_authentication? || api_key.present?)
            render "spree/api/errors/invalid_api_key", status: 401 and return
          else
            # An anonymous user
            @current_api_user = Spree.user_class.new
          end
        end

        def valid_partner_key?
          params[:partner_key] == ENV['FEDEX_CROSSBORDER_PARTNER_KEY']
        end

        def status
          if Spree::FedexCrossborderOrderConfirmation::STATUSES.has_value?(params[:status])
            params[:status]
          end
        end

        def xml_doc
          begin
            @xml_doc = Nokogiri::XML(@xml) do |config|
              config.strict.nonet
            end
          rescue => e
            puts "Cannot parse XML: #{@xml}. #{e}"
            raise "Cannot parse XML: #{@xml}. #{e}"
          end
        end

        # We pass our order_id to FedEx in the custom_order1 field
        def order_id
          begin
            @xml_doc.at_xpath('//custom_order1').content.strip
          rescue => e
            puts "Error extracting order_id from XML: #{@xml}. #{e}"
            raise "Error extracting order_id from XML: #{@xml}. #{e}"
          end
        end

        # We pass our order_number to FedEx in the custom_order2 field
        def order_number
          begin
            @xml_doc.at_xpath('//custom_order2').content.strip
          rescue => e
            puts "Error extracting order_number from XML: #{@xml}. #{e}"
            raise "Error extracting order_number from XML: #{@xml}. #{e}"
          end
        end

        # If products have been cancelled from the FedEx order, remove their corresponding line items
        def update_line_items
          begin
            variant_ids = @xml_doc.xpath('//custom_1').map { |node| node.content.strip }
          rescue => e
            puts "Error extracting variant_ids from XML: #{@xml}. #{e}"
            raise "Error extracting variant_ids from XML: #{@xml}. #{e}"
          end

          order = Spree::Order.find(order_id)
          order.line_items.each do |line_item|
            unless variant_ids.include? line_item.variant_id
              order.line_items.delete(line_item.id)
            end
          end
        end

      end
    end
  end
end
