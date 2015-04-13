Rails.application.routes.draw do
  resources :orders
  resources :order_items, except: [:show, :index, :new]
  root 'products#index'
  resources :products
end
