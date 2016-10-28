Rails.application.routes.draw do
  resources :users
  resources :music_styles
  resources :concerts
  resources :user_preferences
  resources :reservations
  resources :concert_preferences

  get 'home/index'
  root 'home#index'
  post 'concerts/:id/reservation' => 'concerts#reservation'

  get 'concerts/search/:location' => 'concerts#search'
  #get 'concerts/search.json?location=:location' => 'concerts#search'
  get 'concerts/search.json' => 'concerts#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
