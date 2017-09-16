Rails.application.routes.draw do
  resources :comments, only: [:create, :update, :destroy]
  resources :users, only: [:create]

  get :haute_couture, to: 'haute_couture#show'
end
