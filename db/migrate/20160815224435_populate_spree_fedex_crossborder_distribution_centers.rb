class PopulateSpreeFedexCrossborderDistributionCenters < ActiveRecord::Migration
  def up
    Spree::FedexCrossborderDistributionCenter.create!({
        name: 'West',
        address_line_1: '861 E Sandhill Ave',
        address_line_2: 'MB# 323391',
        city: 'Carson',
        state: Spree::State.find_by(abbr: 'CA', country: Spree::Country.find_by(iso: 'US')),
        zip: '90746',
        zone: Spree::Zone.find_by(name: 'USA')
    })
  end

  def down
    Spree::FedexCrossborderDistributionCenter.destroy_all
  end
end
