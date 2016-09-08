Spree::Core::ControllerHelpers::Order.class_eval do

  # All orders are processed in USD regardless of what is displayed to the user
  def current_order_params
    { currency: 'USD', guest_token: cookies.signed[:guest_token], store_id: current_store.id, user_id: try_spree_current_user.try(:id) }
  end

end
