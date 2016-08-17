class PopulateSpreeFedexCrossborderDistributionCenters < ActiveRecord::Migration
  def up
    Spree::FedexCrossborderDistributionCenter.create!({
        name: 'West',
        address1: '861 E Sandhill Ave',
        address2: 'MB# 323391',
        city: 'Carson',
        state: Spree::State.find_by(abbr: 'CA', country: Spree::Country.find_by(iso: 'US')),
        zipcode: '90746',
        country: Spree::Country.find_by(iso: 'US'),
        zone: Spree::Zone.find_by(name: 'USA')
    })
  end

  def down
    Spree::FedexCrossborderDistributionCenter.destroy_all
  end
end
