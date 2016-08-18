module SpreeFedexCrossborder
  class Shipments

    # For international orders, we're passing the products to Fedex Crossborder
    # via hidden form fields. Get a merged list of all items to loop over.
    # We are deriving the product price from the display amount instead of just using
    # the variant price in order to take into account the calculated price for murals based on area.
    def self.merge_for_display order

      order_items = []
      order.shipments.each do |shipment|
        shipment.manifest.each do |manifest_item|
          line_item = order.line_items.find { |li| li.variant_id == manifest_item.variant.id }
          order_item = {
              :variant => manifest_item.variant,
              :quantity => manifest_item.quantity,
              :display_amount => line_item.display_amount.to_html({ symbol: false, thousands_separator: false }).to_f,
              :product_price => line_item.display_amount.to_html({ symbol: false, thousands_separator: false }).to_f / line_item.quantity
          }
          order_items << order_item
        end
      end

      order_items

    end
  end
end
