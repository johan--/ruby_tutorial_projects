Rails.application.routes.draw do
  resources :videos, only: [:index, :new, :create]
  root to: 'videos#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout
  resources :video_uploads, only: [:new, :create]
end
