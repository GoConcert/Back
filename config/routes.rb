Rails.application.routes.draw do
  resources :users
  resources :music_styles
  resources :concerts
  resources :user_preferences
  resources :reservations
  resources :concert_preferences
  get 'home/index'
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
