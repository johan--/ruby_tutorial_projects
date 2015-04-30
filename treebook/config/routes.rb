Rails.application.routes.draw do
  resources :albums
  root 'statuses#index'
  resources :statuses
  devise_for :users
end
