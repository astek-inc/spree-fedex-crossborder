module Spree
  module Api
    module V1
      class FedexCrossborderOrderConfirmationsController < Spree::Api::BaseController

        def create

          confirmation = {
              :order_id => 57441,
              :raw_data => 'data'
          }

          Spree::FedexCrossborderOrderConfirmation.create confirmation
          #
          # file = File.open("#{Rails.root}/log/tmp.log", 'a+')
          # file.puts "Spree::Api::V1::Controller#create called at #{Time.now}"
          # file.close
        end

      end
    end
  end
end
