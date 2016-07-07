module Spree
  class FedexCrossborderOrderConfirmation < ActiveRecord::Base

    belongs_to :order

    attr_accessor :pretty_status
    attr_accessor :status_text

    STATUSES = {
        new: 'N',
        pending: 'R',
        vended: 'V',
        cancelled: 'C',
        inventory: 'I',
        processing: 'P',
        delivered: 'D',
        customer_inquiry: 'Q'
    }

    def pretty_status
      status_text.to_s.gsub(/_/, ' ')
    end

    def status_text
      STATUSES.key(self.status)
    end

  end
end
