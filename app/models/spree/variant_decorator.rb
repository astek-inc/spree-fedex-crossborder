Spree::Variant.class_eval do
  def price_in currency_code
    price_in_usd = prices.detect { |price| price.currency == Spree::Config[:currency] } || prices.build(currency: Spree::Config[:currency])

    unless currency_code == Spree::Config[:currency]
      converted = price_in_usd.dup
      converted.amount = Spree::ExchangeRate.convert(price_in_usd.amount, currency_code)
      converted.currency = currency_code
      converted
    else
      price_in_usd
    end
  end
end
