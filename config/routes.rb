Spree::Core::Engine.routes.draw do
  resources :countries do
    member do
      get 'select'
    end
  end

  get 'countries/:iso/find_by_iso', to: 'countries#find_by_iso', as: 'country_by_iso'

  resources :currencies

  get 'exchange_rates/:code/find_by_code', to: 'exchange_rates#find_by_code', as: 'exchange_rate_by_code'

  namespace :admin do
    resources :currencies
  end
end
