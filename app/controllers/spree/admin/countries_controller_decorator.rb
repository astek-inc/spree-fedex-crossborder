Spree::Admin::CountriesController.class_eval do

  before_action :load_currencies, only: [:new, :edit]

  private

  def load_currencies
    @currencies = Spree::Currency.all
  end

end
