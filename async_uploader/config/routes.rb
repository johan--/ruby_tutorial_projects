Rails.application.routes.draw do
  resources :photos, only: [:new, :create]
  root to: 'photos#new'
  get '/photos/new_multiple', to: 'photos#new_multiple', as: :new_photo_multiple
end
