Rails.application.routes.draw do
  resources :comments, only: [:new, :create]
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#auth_fail'
  get '/sign_out', to: 'sessions#destroy', as: :sign_out
end
