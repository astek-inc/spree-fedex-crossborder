Spree::BaseHelper.class_eval do
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
end
