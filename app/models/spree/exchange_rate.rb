module Spree
  class ExchangeRate < Spree::Base

    belongs_to :currency, :foreign_key => :code, :primary_key => :code

    require 'open-uri'
    require 'json'

    def self.fetch_updates
      url = Rails.configuration.fedex_crossborder_exchange_rate_url + ENV['FEDEX_CROSSBORDER_PARTNER_KEY']
      response = open(url).read
      rates = JSON.parse(response)

      rates['USD'].each do |rate|
        item = self.find_or_create_by!(code: rate['code'])
        item.value = rate['value']
        item.save!
      end
    end

    def self.convert amount, code
      unless code == Spree::Config[:currency]
        amount * self.find_by(code: code).value
      else
        amount
      end
    end

  end
end
