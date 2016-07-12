module Spree
  class CurrenciesController < Spree::StoreController

    def show
      render :json => Spree::Currency.with_exchange_rate.where(id: params[:id]).take.to_json(:include => :exchange_rate)
    end

  end
end
