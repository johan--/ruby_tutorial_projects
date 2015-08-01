Rails.application.routes.draw do
  resources :photos, only: [:new, :create]
  root to: 'photos#new'
end
