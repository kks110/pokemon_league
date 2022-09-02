Rails.application.routes.draw do
  root "players#index"

  get '/matches', to: 'matches#index'

  resources :players
  resources :matches
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
