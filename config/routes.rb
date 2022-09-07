Rails.application.routes.draw do
  root "players#index"

  get '/matches', to: 'matches#index'

  resources :players
  resources :matches

  get '/generate_matches', to: 'players#generate_matches'
  post '/matches_to_play', to: 'players#matches_to_play'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
