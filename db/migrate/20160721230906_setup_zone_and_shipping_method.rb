class SetupZoneAndShippingMethod < ActiveRecord::Migration

  EXISTING_INTERNATIONAL_ZONES = [
      { name: 'EU_VAT', description: 'Countries that make up the EU VAT zone.', kind: 'country', country_ids: [12, 20, 22, 55, 59, 64, 70, 75, 57, 100, 102, 110, 135, 133, 134, 153, 166, 179, 183, 188, 201, 199, 68, 196, 77] },
      { name: 'UK', description: 'The United Kingdom', kind: 'country', country_ids: [77] }
  ]
  EXISTING_INTERNATIONAL_SHIPPING_METHOD = { name: 'UPS Worldwide Expedited', admin_name: 'UPS Worldwide Expedited', display_on: '' }
  EXISTING_SHIPPING_METHOD_CALCULATOR = { type: 'Spree::Calculator::Shipping::Ups::WorldwideExpedited', calculable_type: 'Spree::ShippingMethod' }


  NON_USA_ZONE = { name: 'Non-USA', description: 'All countries outside the United States', kind: 'country' }
  FEDEX_CROSSBORDER_SHIPPING_METHOD = { name: 'FedEx CrossBorder', admin_name: 'FedEx CrossBorder', display_on: :back_end }
  FEDEX_CROSSBORDER_SHIPPING_METHOD_CALCULATOR = { type: 'Spree::Calculator::Shipping::FlatRate', calculable_type: 'Spree::ShippingMethod' }

  def up
    zone = Spree::Zone.create!(NON_USA_ZONE)
    Spree::Country.where.not(iso: 'US').order(:name).each do |country|
      zone.zone_members << Spree::ZoneMember.create!(zoneable_id: country.id, zoneable_type: 'Spree::Country')
    end

    shipping_method = Spree::ShippingMethod.new(FEDEX_CROSSBORDER_SHIPPING_METHOD)
    shipping_method.zones << zone

    shipping_method.shipping_categories << Spree::ShippingCategory.find_by(name: 'Default')
    shipping_method.calculator = Spree::Calculator.create!(FEDEX_CROSSBORDER_SHIPPING_METHOD_CALCULATOR)

    shipping_method.save!

    EXISTING_INTERNATIONAL_ZONES.each do |zone|
      Spree::Zone.find_by(name: zone[:name]).destroy
    end
    Spree::ShippingMethod.find_by(EXISTING_INTERNATIONAL_SHIPPING_METHOD).destroy
  end

  def down
    Spree::Zone.find_by(NON_USA_ZONE).destroy
    Spree::ShippingMethod.find_by(FEDEX_CROSSBORDER_SHIPPING_METHOD).destroy
    # Spree::Calculator.find_by(FEDEX_CROSSBORDER_SHIPPING_METHOD_CALCULATOR).destroy

    created_zones = []
    EXISTING_INTERNATIONAL_ZONES.each do |zone|
      created_zone = Spree::Zone.create!(name: zone[:name], description: zone[:description], kind: zone[:kind])
      Spree::Country.find(zone[:country_ids]).each do |country|
        created_zone.zone_members << Spree::ZoneMember.create!(zoneable_id: country.id, zoneable_type: 'Spree::Country')
      end
      created_zones << created_zone
    end

    shipping_method = Spree::ShippingMethod.new(EXISTING_INTERNATIONAL_SHIPPING_METHOD)
    created_zones.each do |created_zone|
      shipping_method.zones << created_zone
    end

    shipping_method.shipping_categories << Spree::ShippingCategory.find_by(name: 'Default')
    shipping_method.calculator = Spree::Calculator.create!(EXISTING_SHIPPING_METHOD_CALCULATOR)

    shipping_method.save!
  end

end

