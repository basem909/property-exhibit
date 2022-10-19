Rails.application.routes.draw do
  resources :bookings
  # devise_for :users
  root 'properties#index'
  resources :properties
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
