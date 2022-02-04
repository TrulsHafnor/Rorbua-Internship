Rails.application.routes.draw do
  resources :favourittes
  devise_for :users
  resources :stories

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "feed#index"
end
