module Spree
  class Currency < ActiveRecord::Base
    has_one :exchange_rate, :foreign_key => :code, :primary_key => :code
    has_many :countries
    default_scope { order(name: :asc) }
    scope :with_exchange_rate, -> { includes(:exchange_rate) }
    acts_as_paranoid
  end
end
