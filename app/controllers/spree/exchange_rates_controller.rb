module Spree
  class ExchangeRatesController < Spree::StoreController

    def find_by_code
      render :json => Spree::ExchangeRate.where(code: params[:code]).take
    end

  end
end
