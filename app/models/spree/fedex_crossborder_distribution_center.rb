module Spree
  class FedexCrossborderDistributionCenter < ActiveRecord::Base
    acts_as_paranoid
    belongs_to :state
    belongs_to :country
    belongs_to :zone

    validates :name, presence: true
    validates :address1, presence: true
    validates :city, presence: true
    validates :state_id, presence: true
    validates :zipcode, presence: true
    validates :country_id, presence: true
    validates :zone_id, presence: true
  end
end

