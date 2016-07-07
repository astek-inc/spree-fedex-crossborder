module Spree
  class FedexCrossborderOrderConfirmation < ActiveRecord::Base

    belongs_to :order

    attr_accessor :pretty_status
    attr_accessor :status_text

    STATUSES = {
      new: 'N', # Sent when an order is considered new in the Bongo System.
      pending: 'R', # Sent when an order is under Payment Review.
      vended: 'V', # Sent when an order is complete, and ready to be sent to Bongo.
      cancelled: 'C', # Sent when items have been cancelled off of an order.
      blacklist: 'B', # Sent when an order was placed by a blacklisted Bongo customer.
      inventory: 'I', # Sent when items have been delivered to Bongo.
      processing: 'P', # Sent when items are preparing to depart the Bongo DC.
      shipped: 'S', # Sent when items have departed the Bongo DC.
      delivered: 'D', # Sent when items have been delivered to the customer.
      customer_inquiry: 'Q' # Sent when CS notes have been entered into the Bongo system. This status includes the CS notes.
    }

    def pretty_status
      status_text.to_s.gsub(/_/, ' ')
    end

    def status_text
      STATUSES.key(self.status)
    end

  end
end
