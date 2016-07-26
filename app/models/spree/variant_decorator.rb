Spree::Variant.class_eval do

  require 'savon'

  after_create :push_to_fedex_crossborder

  attr_accessor :client

  # After a new variant is created, notify FedEx CrossBorder.
  def push_to_fedex_crossborder
    set_client if client.nil?
    begin
      response = self.client.call(:connect_product_info, message: fedex_crossborder_variant_message)
      unless response.body[:connect_product_info_response][:return][:error] == '0'
        raise 'Error pushing new variant to FedEx CrossBorder: '+response.body[:connect_product_info_response][:return][:error_message].to_s
      end
    rescue => error
      puts error
    end
  end

  # Create a SOAP client for the FedEx CrossBorder service.
  def set_client
    self.client = Savon.client(
        wsdl: Rails.configuration.fedex_crossborder_api_url,
        # strip_namespaces: true,
        # log: true,
        # pretty_print_xml: true
    )

    # puts self.client.operations
    # connect_product_info
    # connect_landed_cost
    # connect_order
    # connect_order_remove
    # connect_order_tracking_update
    # connect_sku_status
  end

  # Set up a data structure that will be transformed to XML by Savon.
  def fedex_crossborder_variant_message
    return { :request => {
      :partnerKey => ENV['FEDEX_CROSSBORDER_PARTNER_KEY'],
      :language => 'en',
      :items => {
        :item => [{
          :productID => self.sku,
          :description => self.product.name,
          :url => 'https://www.designyourwall.com/products/'+self.product.slug,
          :imageUrl => image_url(master_variant.images.first),
          :price => formatted_price(self.price),
          :countryOfOrigin => 'US',
          :hsCode => '',
          :eccn => '',
          :hazFlag => 0,
          :licenseFlag => '',
          :importFlag => '',
          :productType => 0,
          :itemInformation => {
            :item => [{
              :l => self.depth.to_s,
              :w => self.width.to_s,
              :h => self.height.to_s,
              :wt => self.weight.to_s,
            }]
          }
        }]
      }
    }}
  end

  # Get the master variant. This is the variant that has images associated with it.
  def master_variant
    Spree::Variant.find_by(product_id: self.product_id, is_master: true)
  end

  def image_url img
    unless img.nil?
      return img.attachment.url(:product)
    end
  end

  def formatted_price price
    return sprintf('%.2f', price)
  end

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
