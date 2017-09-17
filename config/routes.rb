Rails.application.routes.draw do
  resources :comments, only: [:create, :update, :destroy] do
    resources :likes, only: [:create]
  end

  resources :likes, only: [:destroy]

  resources :users, only: [:create]

  get :haute_couture, to: 'haute_couture#show'
end
