module Spree
  class ExchangeRate < Spree::Base

    require 'open-uri'
    require 'json'


    def self.fetch_updates
      url = url = Rails.configuration.fedex_crossborder_exchange_rate_url + ENV['FEDEX_CROSSBORDER_PARTNER_KEY']
      response = open(url).read
      rates = JSON.parse(response)

      rates['USD'].each do |rate|
        item = self.find_or_create_by!(code: rate['code'])
        item.value = rate['value']
        item.save!
      end
    end

  end
end
