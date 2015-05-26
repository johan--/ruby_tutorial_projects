Rails.application.routes.draw do
  root to: 'pages#index'
  resources :sessions, only: [:update]
  resources :projects
end
