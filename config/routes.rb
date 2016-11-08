Rails.application.routes.draw do

  get 'users/search.json' => 'users#search'
  resources :users
  get 'concerts/search.json' => 'concerts#search'
  resources :music_styles
  get 'concerts/search.json' => 'concerts#search'
  resources :concerts
  resources :user_preferences
  resources :reservations
  get 'concert_preferences/search.json' => 'concert_preferences#search'
  resources :concert_preferences

  get 'music_styles' => 'music_styles#index'

  get 'home/index'
  root 'home#index'

  get 'concerts/:id' => 'concerts#show'

  get 'concerts/search/:location' => 'concerts#search'

  get 'concerts/search/:music_style' => 'concerts#search'

  get 'music_styles/search/:name' => 'music_styles#search'

  get 'users/search/:user_name' => 'users#search'

  get 'users/search/:password' => 'users#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
