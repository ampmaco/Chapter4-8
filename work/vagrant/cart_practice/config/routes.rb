Rails.application.routes.draw do
  root 'store#index', as: 'store'
  resources :products
  resources :line_items
  resources :carts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
