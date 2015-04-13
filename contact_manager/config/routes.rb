Rails.application.routes.draw do
  root 'companies#index'
  resources :companies
  resources :email_addresses, :except => [:index, :show]
  resources :phone_numbers, :except => [:index, :show]
  resources :people
  resource :sessions, :only => [:create]
  get '/auth/:provider/callback' => 'sessions#create'
end
