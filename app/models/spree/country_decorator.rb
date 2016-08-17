module Spree
  Country.class_eval do

    has_many :fedex_crossborder_distribution_centers
    belongs_to :currency

    # Fedex does not provide exchange rates for all currencies.
    # If we have no exchange rate we will require U.S. dollars.
    def self.currency_in_use country_iso
      currency = Spree::Currency.with_exchange_rate.find(Spree::Country.find_by(iso: country_iso).currency_id)
      unless currency.exchange_rate.nil?
        currency.code
      else
        Spree::Config[:currency]
      end
    end

  end
end
