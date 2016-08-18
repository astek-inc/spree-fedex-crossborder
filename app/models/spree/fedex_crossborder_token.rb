module Spree
  class FedexCrossborderToken < Spree::Base

    require 'net/http'
    require 'json'

    def self.get_token(order, items, total_domestic_shipping)
      uri = URI.parse(ENV['FEDEX_CROSSBORDER_CHECKOUT_SECURITY_URL'])
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Post.new(uri.request_uri)
      request.basic_auth(ENV['FEDEX_CROSSBORDER_USERNAME'], ENV['FEDEX_CROSSBORDER_PASSWORD'])
      form_data = {
        'PARTNER_KEY' => ENV['FEDEX_CROSSBORDER_PARTNER_KEY'],
        'TOTAL_DOMESTIC_SHIPPING_CHARGE' => total_domestic_shipping,
        'CUSTOM_ORDER_1' => order.id,
        'CUSTOM_ORDER_2' => order.number,
        'ORDER_CURRENCY' => 'USD',
        'CUST_FIRST_NAME' => order.bill_address.firstname,
        'CUST_LAST_NAME' => order.bill_address.lastname,
        'CUST_COMPANY' => order.bill_address.company,
        'CUST_ADDRESS_LINE_1' => order.bill_address.address1,
        'CUST_ADDRESS_LINE_2' => order.bill_address.address2,
        'CUST_CITY' => order.bill_address.city,
        'CUST_STATE' => order.bill_address.state.name,
        'CUST_COUNTRY' => order.bill_address.country.iso,
        'CUST_ZIP' => order.bill_address.zipcode,
        'CUST_PHONE' => order.bill_address.phone,
        'CUST_EMAIL' => order.email,
        'SHIP_FIRST_NAME' => order.ship_address.firstname,
        'SHIP_LAST_NAME' => order.ship_address.lastname,
        'SHIP_COMPANY' => order.ship_address.company,
        'SHIP_ADDRESS_LINE_1' => order.ship_address.address1,
        'SHIP_ADDRESS_LINE_2' => order.ship_address.address2,
        'SHIP_CITY' => order.ship_address.city,
        'SHIP_STATE' => order.ship_address.state.name,
        'SHIP_COUNTRY' => order.ship_address.country.iso,
        'SHIP_ZIP' => order.ship_address.zipcode,
        'SHIP_PHONE' => order.ship_address.phone,
        'SHIP_EMAIL' => order.email
      }

      items.each.with_index(1) do |item, i|
        form_data["PRODUCT_ID_#{i}"] = item[:variant].sku
        form_data["PRODUCT_NAME_#{i}"] = item[:variant].product.name
        form_data["PRODUCT_PRICE_#{i}"] = item[:product_price]
        form_data["PRODUCT_Q_#{i}"] = item[:quantity]
        form_data["PRODUCT_SHIPPING_#{i}"] = 0.to_f
        form_data["PRODUCT_CUSTOM_1_#{i}"] = item[:variant].id
      end

      # require 'pry'
      # Pry::ColorPrinter.pp(form_data)

      request.set_form_data(form_data)
      response = http.request(request)

      if response.code == '200'
        response_body = JSON.parse response.body
        if response_body['error'] == 0
          response_body['token']
        end
      end
    end
  end
end
