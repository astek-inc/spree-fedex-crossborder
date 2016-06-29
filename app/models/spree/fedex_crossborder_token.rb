module Spree
  class FedexCrossborderToken < Spree::Base

    require 'net/http'
    require 'json'

    def self.get_token

      uri = URI.parse(ENV['FEDEX_CROSSBORDER_CHECKOUT_SECURITY_URL'])
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Post.new(uri.request_uri)
      request.basic_auth(ENV['FEDEX_CROSSBORDER_USERNAME'], ENV['FEDEX_CROSSBORDER_PASSWORD'])
      request.set_form_data({'PARTNER_KEY' => ENV['FEDEX_CROSSBORDER_PARTNER_KEY']})

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
