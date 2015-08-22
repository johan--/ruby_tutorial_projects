Rails.application.routes.draw do
  root 'movies#index'
  resources :movies, only: [:show, :index]
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
end
