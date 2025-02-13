Rails.application.routes.draw do
  # These got automatically added with the rails generator but we don't need them
  # get 'sessions/create'
  # get 'sessions/destroy'

  resources :tickets, only: [:create]
  resources :users, only: [:show, :create]
  # resources :cast_members
  resources :productions, only: [ :index, :show, :create, :update, :destroy]
  # Custome Route
  post "/login", to: "sessions#create" 
  post "/logout", to: "sessions#destroy" 
  # get "/welcome", to: "productions#welcome"
  # get "/welcome/:id", to: "productions#welcome_show"


  

end
