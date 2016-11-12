Rails.application.routes.draw do
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

  get 'concerts/search/:music_style' => 'concerts#search'
  get 'concerts/search/:location' => 'concerts#search'
  get 'users/search/:user_name' => 'users#search'
  get 'users/search/:password' => 'users#search'

  post 'concerts/:concert_id/reservation' => 'concerts#reservation'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
