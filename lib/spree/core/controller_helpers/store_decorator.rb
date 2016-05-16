Spree::Core::ControllerHelpers::Store.class_eval do

  def current_currency
    unless cookies.permanent[:currency].blank?
      cookies.permanent[:currency]
    else
      Spree::Config[:currency]
    end
  end

end
