Spree::Order.class_eval do
  has_one :fedex_crossborder_order_confirmation
end
