Rails.application.routes.draw do
  devise_for :users
  root to: "home#index" 
  resources :home do
  collection do
    get "search"
  end
end
  resources :informations do
    resources :comments, only: :create
  end
  resources :users
end
