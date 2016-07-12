ApplicationController.class_eval do

  before_action :set_location_cookies

  def set_location_cookies
    if cookies.permanent[:country].blank?
      iso = country_iso_from_ip
      set_country_cookie iso
      set_currency_cookie iso
    elsif cookies.permanent[:currency].blank?
      iso = cookies.permanent[:country]
      set_currency_cookie iso
    end
  end

  def country_iso_from_ip
    response = Geoip2.country(request.remote_ip)
    location_data = response.to_hash
    country = location_data['country']

    unless country['iso_code'].nil?
      return country['iso_code']
    else
      return Rails.configuration.default_country_iso
    end
  end

  def set_country_cookie iso
    cookies.permanent[:country] = iso
  end

  def set_currency_cookie country_iso
    cookies.permanent[:currency] = Spree::Country.currency_in_use country_iso
  end

end
