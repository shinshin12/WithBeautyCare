Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :informations, only: [:new, :create, :show, :edit, :update, :index]
  resources :users, only: [:show, :edit, :update]
end
