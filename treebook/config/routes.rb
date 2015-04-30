Rails.application.routes.draw do
  root 'statuses#index'
  resources :statuses
  devise_for :users
end
