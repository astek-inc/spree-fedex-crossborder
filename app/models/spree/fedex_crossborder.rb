module Spree
  class FedexCrossborder #< Spree::Base

    def self.get_token
      require 'net/http'
      # require 'uri'

      uri = URI.parse(ENV['FEDEX_CROSSBORDER_CHECKOUT_SECURITY_URL'])
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Post.new(uri.request_uri)
      request.basic_auth(ENV['FEDEX_CROSSBORDER_USERNAME'], ENV['FEDEX_CROSSBORDER_PASSWORD'])
      request.set_form_data({'PARTNER_KEY' => ENV['FEDEX_CROSSBORDER_PARTNER_KEY']})

      response = http.request(request)

      response
      #
      # # response.body
      # # response.status
      # # response["header-here"] # All headers are lowercase
    end
  end
end
