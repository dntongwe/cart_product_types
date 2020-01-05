Rails.application.routes.draw do

  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    root "products#index"
    resources :product_types
    resources :orders
    #resources :payment_notifications
    resources :carts
    resources :cart_items
    resources :products
    resources :searches
    resources :categories
    resources :letters
    get 'current_cart', action: :show, controller: 'carts'
    #current_cart 'cart', :controller => 'carts', :action => 'show'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.ht
  end
  get '*path', to: redirect("/#{I18n.default_locale}/%{path}"), constraints: lambda { |req| !req.path.starts_with? "/#{I18n.default_locale}/" }
  get '', to: redirect("/#{I18n.default_locale}")
end
