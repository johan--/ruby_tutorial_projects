Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resource :account, only: [:new, :create]
end
