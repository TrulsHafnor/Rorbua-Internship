Rails.application.routes.draw do
  resources :comments
  resources :favourites
  devise_for :users
  resources :stories
  resources :likes, only: [:create, :destroy]
  resources :dislikes, only: [:create, :destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "stories#index"
end
