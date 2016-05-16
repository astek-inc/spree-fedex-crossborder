Spree::Core::ControllerHelpers::Search.class_eval do
  # Prices are stored in USD. We convert them to current_currency
  # after pulling product data.
  def build_searcher(params)
    Spree::Config.searcher_class.new(params).tap do |searcher|
      searcher.current_user = try_spree_current_user
      searcher.current_currency = Spree::Config[:currency]
    end
  end
end

