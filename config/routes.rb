Rails.application.routes.draw do
  resources :users
  get 'music_styles/search.json' => 'music_styles#search'
  resources :music_styles
  get 'concerts/search.json' => 'concerts#search'
  resources :concerts
  resources :user_preferences
  resources :reservations
  resources :concert_preferences

  get 'music_styles' => 'music_styles#index'

  get 'home/index'
  root 'home#index'
  post 'concerts/:id/reservation' => 'concerts#reservation'

  get 'concerts/search/:location' => 'concerts#search'
  get 'music_styles/search/:name' => 'music_styles#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
