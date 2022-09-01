Rails.application.routes.draw do

  resources :users, only: [:index, :create]
  resources :weapons, only: [:index, :create, :show, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
