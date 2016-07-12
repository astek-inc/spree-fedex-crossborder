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

      unless session[:return_to].nil?
        redirect_to session.delete(:return_to)
      else
        redirect_to '/'
      end

    end

    def find_by_iso
      render :json => Spree::Country.where(iso: params[:iso]).take
    end

  end
end
