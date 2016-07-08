Spree::Order.class_eval do

  has_many :fedex_crossborder_order_confirmations, -> { order(created_at: :desc) }

  attr_reader :current_fedex_crossborder_confirmation

  def current_fedex_crossborder_confirmation
    self.fedex_crossborder_order_confirmations.first
  end

end
