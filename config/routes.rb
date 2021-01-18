Rails.application.routes.draw do
  devise_for :users
  root to: "users#index" 
  resources :informations do 
   resources :comments, only: :create
   resources :likes, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  resources :users do 
    collection do
      get "search"
    end
  end
end
