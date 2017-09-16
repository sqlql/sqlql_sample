Rails.application.routes.draw do
  resources :comments, only: [:create, :update, :destroy]
  resources :users, only: [:create]
end
