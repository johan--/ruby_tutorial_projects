Rails.application.routes.draw do
  resources :statuses
  devise_for :users
end
