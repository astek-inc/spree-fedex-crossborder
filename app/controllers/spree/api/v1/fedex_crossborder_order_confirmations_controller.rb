module Spree
  module Api
    module V1
      class FedexCrossborderOrderConfirmationsController < Spree::Api::BaseController

        require 'base64'
        require 'nokogiri'

        def create
          unless partner_key
            raise "Invalid partner key: #{params[:partner_key]}"
          end

          unless @xml = Base64.strict_decode64(params[:order])
            raise "Invalid XML: #{params[:order]}"
          end
          @xml_doc = xml_doc

          confirmation = {
              :order_id => order_id,
              :order_number => order_number,
              :status => status,
              :data => @xml
          }

          Spree::FedexCrossborderOrderConfirmation.create confirmation

          respond_to do |format|
            format.text { render text: '{SUCCESS}' }
          end

        end

        def partner_key
          params[:partner_key] == ENV['FEDEX_CROSSBORDER_PARTNER_KEY']
        end

        def status
          if Spree::FedexCrossborderOrderConfirmation::STATUSES.has_value?(params[:status])
            params[:status]
          else
            raise "Invalid status: #{params[:status]}"
          end
        end

        def xml_doc
          begin
            @xml_doc = Nokogiri::XML(@xml) do |config|
              config.strict.nonet
            end
          rescue => e
            raise "Cannot parse XML: #{@xml}. #{e}"
          end
        end

        # We pass our order_id to FedEx in the custom_order1 field
        def order_id
          begin
            @xml_doc.at_xpath('//custom_order1').content.strip
          rescue => e
            raise "Error extracting order_id from XML: #{@xml}. #{e}"
          end
        end

        # We pass our order_number to FedEx in the custom_order2 field
        def order_number
          begin
            @xml_doc.at_xpath('//custom_order2').content.strip
          rescue
            raise "Error extracting order_number from XML: #{@xml}. #{e}"
          end
        end

      end
    end
  end
end
