Rails.application.routes.draw do
  resources :addresses
  root 'products#index'
  resources :orders
  resources :order_items, except: [:show, :index, :new]
  resources :products

  resource :sessions, :only => [:create, :destroy]
  get '/auth/:provider/callback' => 'sessions#create'

  get "/login" => redirect("/auth/twitter"), as: :login
  delete "/logout" => "sessions#destroy", as: :logout
end
