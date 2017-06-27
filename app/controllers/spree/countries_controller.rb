module Spree
  class CountriesController < Spree::StoreController

    def index
      session[:return_to] = request.referer
      @countries = Spree::Country.order(:name)
    end

    def select
      country = Spree::Country.where(id: params[:id]).take

      unless country.nil?
        set_country_cookie country.iso
        set_currency_cookie country.iso

        flash[:success] = 'Country changed successfully.'
      else
        flash[:danger] = 'Unable to change country.'
      end

      set_no_cache_headers

      unless session[:return_to].nil?
        redirect_to session.delete(:return_to)
      else
        redirect_to '/'
      end

    end

    def find_by_iso
      render :json => Spree::Country.where(iso: params[:iso]).take
    end

    private

    # Clear cache because there is sample ordering information on the product pages that only appears for US orders
    def set_no_cache_headers
      response.headers['Cache-Control'] = 'no-cache, no-store'
      response.headers['Pragma'] = 'no-cache'
      response.headers['Expires'] = 'Thu, 01 Jan 1970 00:00:00 GMT'
    end

  end
end
