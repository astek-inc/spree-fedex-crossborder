Spree::Order.class_eval do

  has_many :fedex_crossborder_order_confirmations, -> { order(created_at: :desc) }

  attr_reader :current_fedex_crossborder_confirmation

  def current_fedex_crossborder_confirmation
    self.fedex_crossborder_order_confirmations.first
  end

  # Guest checkout doesn't seem to have shipping rates set for some reason.
  # Force it to FedEx Crossborder's rate of 0 here if needed.
  def ensure_available_shipping_rates

    if shipments.any?
      shipments.each do |sh|
        if sh.shipping_rates.blank? && sh.address.country.iso != 'US'
          Spree::ShippingRate.create({
              shipment_id: sh.id,
              shipping_method_id: Spree::ShippingMethod.find_by(name: 'FedEx CrossBorder').id,
              selected: true,
              cost: 0
          })
        end
      end
      return true
    end

    if shipments.empty? || shipments.any? { |shipment| shipment.shipping_rates.blank? }
      # After this point, order redirects back to 'address' state and asks user to pick a proper address
      # Therefore, shipments are not necessary at this point.
      shipments.destroy_all
      errors.add(:base, Spree.t(:items_cannot_be_shipped)) and return false
    end
  end

end
