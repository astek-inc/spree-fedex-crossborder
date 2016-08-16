module Spree
  Zone.class_eval do
    has_one :fedex_crossborder_distribution_center
  end
end
