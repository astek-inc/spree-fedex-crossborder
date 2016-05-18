ApplicationController.class_eval do

  require 'json'
  require 'open-uri'

  GEOLOCATION_URL = 'http://ip-api.com/json/'

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
    response = open(GEOLOCATION_URL+request.remote_ip).read
    location_data = JSON.parse(response)

    unless location_data['countryCode'].nil?
      return location_data['countryCode']
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
