Rails.application.routes.draw do
  root 'products#index'
  resources :orders
  resources :order_items, except: [:show, :index, :new]
  resources :products

  get '/auth/:provider/callback' => 'sessions#create'
end
