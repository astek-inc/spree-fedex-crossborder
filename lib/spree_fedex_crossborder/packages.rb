module SpreeFedexCrossborder
  class Packages

    def self.total_domestic_shipping packages

      total_domestic_shipping = 0
      packages.each do |package|
        total_domestic_shipping += domestic_shipping_rate package
      end
      total_domestic_shipping
    end

    # Use the ActiveShipping calculator to get the UPS Ground shipping rate
    # from our stock location to the FedEx Distribution center
    def self.domestic_shipping_rate package
      calculator = Spree::Calculator::Shipping::Ups::Ground.new
      package.order.ship_address = fedex_address
      calculator.compute_package package
    end

    def self.fedex_address
      dc = Spree::FedexCrossborderDistributionCenter.find_by(zone: Spree::Zone.find_by(name: 'USA'))
      Spree::Address.new({
                             address1: dc.address1,
                             address2: dc.address2,
                             city: dc.city,
                             state: dc.state,
                             zipcode: dc.zipcode,
                             country: dc.country
                         })
    end

  end
end
