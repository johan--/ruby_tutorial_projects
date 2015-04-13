Rails.application.routes.draw do
  root 'companies#index'

  resources :companies
  resources :people

  resources :email_addresses, :except => [:index, :show]
  resources :phone_numbers, :except => [:index, :show]

  resource :sessions, :only => [:create, :destroy]
  get '/auth/:provider/callback' => 'sessions#create'

  get "/login" => redirect("/auth/twitter"), as: :login
  delete "/logout" => "sessions#destroy", as: :logout
end
