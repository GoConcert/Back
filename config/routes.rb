Rails.application.routes.draw do

  post 'concerts/:id/reservation' => 'concerts#reservation'
  #  post 'concerts/:concert_id/reservation' => 'concerts#reservation'

  get 'concerts/search.json' => 'concerts#search'
  get 'users/search.json' => 'users#search'

  resources :users
  resources :music_styles
  resources :concerts
  resources :concert_preferences
  resources :reservations
  resources :user_preferences

  get 'home/index'
  root 'home#index'
  get 'concerts/:id' => 'concerts#show'
  get 'concerts/search/:user_id' => 'concerts#search'
  get 'concerts/search/:music_style' => 'concerts#search'
  get 'concerts/search/:location' => 'concerts#search'
  get 'users/search/:user_name' => 'users#search'
  get 'users/search/:password' => 'users#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
