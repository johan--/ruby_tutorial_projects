Rails.application.routes.draw do
  resources :orders
  resources :order_items
  root 'products#index'
  resources :products
end
