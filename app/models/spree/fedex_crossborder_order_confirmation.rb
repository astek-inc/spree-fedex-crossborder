module Spree
  class FedexCrossborderOrderConfirmation < ActiveRecord::Base

    belongs_to :order

  end
end
