module Spree
  module Admin
    class CurrenciesController < ResourceController

      def index
        # session[:return_to] = request.url
        respond_with(@collection)
      end

      private

      def permitted_resource_params
        params.require(:currency).permit(:name, :code, :symbol, :symbol_position)
      end

      def collection
        return @collection if @collection.present?
        params[:q] ||= {}
        params[:q][:deleted_at_null] ||= '1'

        params[:q][:s] ||= 'name asc'
        @collection = super
        # Don't delete params[:q][:deleted_at_null] here because it is used in view to check the
        # checkbox for 'q[deleted_at_null]'. This also messed with pagination when deleted_at_null is checked.
        if params[:q][:deleted_at_null] == '0'
          @collection = @collection.with_deleted
        end
        # @search needs to be defined as this is passed to search_form_for
        # Temporarily remove params[:q][:deleted_at_null] from params[:q] to ransack products.
        # This is to include all products and not just deleted products.
        @search = @collection.ransack(params[:q])
                      # .reject { |k, _v| k.to_s == 'deleted_at_null' })
        @collection = @search.result.
            # distinct_by_custom_project_ids(params[:q][:s]).
            # includes(custom_project_includes).
            page(params[:page]).
            per(params[:per_page])
        # || Spree::Config[:admin_custom_projects_per_page])
        @collection
      end

    end
  end
end
