module Spree
  module Admin
    class FedexCrossborderDistributionCentersController < ResourceController

      before_action :get_states, only: [:new, :edit, :update]
      before_action :get_zones, only: [:new, :edit, :update]

      private

      def permitted_resource_params
        params.require(:fedex_crossborder_distribution_center).permit(:name, :address_line_1, :address_line_2, :city, :state_id, :zip, :zone_id)
      end

      def get_states
        @states = Spree::State.where(country: Spree::Country.find_by(iso: 'US')).order(:name)
      end

      def get_zones
        @zones = Spree::Zone.order(:name)
      end

    end
  end
end
