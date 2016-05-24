Spree::BaseHelper.class_eval do

  require 'money'

  def flag_icon country_iso
    image_tag(asset_path('flags/'+country_iso.downcase+'.png'), class: 'flag-icon')
  end

  def current_country
    unless cookies.permanent[:country].blank?
      cookies.permanent[:country]
    else
      Rails.configuration.default_country_iso
    end
  end

  def convert_price(price, currency_code)
    Spree::ExchangeRate.convert(price, currency_code)
  end

  def convert_display_price(price_in_default_currency)
    unless current_currency == Spree::Config[:currency]
      exchange_rate = Spree::ExchangeRate.find_by(code: current_currency).value
      Money.add_rate('USD', current_currency, exchange_rate)
      money = Money.us_dollar(price_in_default_currency * 100).exchange_to(current_currency)
      money.format
    else
      money = Money.new(price_in_default_currency * 100)
      money.format
    end
  end

  def price_for_js_calculation(product_or_variant)
    price_in_usd = product_or_variant.price_in('USD').amount
    unless current_currency == Spree::Config[:currency]
      exchange_rate = Spree::ExchangeRate.find_by(code: current_currency).value
      Money.add_rate('USD', current_currency, exchange_rate)
      money = Money.us_dollar(price_in_usd * 100).exchange_to(current_currency)
      money.format(:symbol => false)
    else
      price_in_usd
    end
  end

end
