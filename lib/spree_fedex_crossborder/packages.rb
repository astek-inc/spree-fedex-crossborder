module SpreeFedexCrossborder
  class Packages

    def self.total_domestic_shipping packages
      total_domestic_shipping = 0
      packages.each do |package|
        total_domestic_shipping += domestic_shipping_rate package
      end

      total_domestic_shipping + SpreeFedexCrossborder.configuration.surcharge_amount
    end

    # Use the ActiveShipping calculator to get the UPS Ground shipping rate
    # from our stock location to the FedEx Distribution center
    def self.domestic_shipping_rate package
      calculator = Spree::Calculator::Shipping::Ups::Ground.new
      package.order.ship_address = fedex_address
      calculator.compute_package package
    end

    def self.fedex_address
      distribution_center = Spree::FedexCrossborderDistributionCenter.find_by(zone: Spree::Zone.find_by(name: 'USA'))

      Spree::Address.new({
        address1: distribution_center.address1,
        address2: distribution_center.address2,
        city: distribution_center.city,
        state: distribution_center.state,
        zipcode: distribution_center.zipcode,
        country: distribution_center.country
      })
    end

  end
end
