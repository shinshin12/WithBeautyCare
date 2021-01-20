Rails.application.routes.draw do
  devise_for :users
  root to: "users#index" 
  resources :informations do 
   resources :comments, only: :create
   resources :likes, only: [:create, :destroy]
  end
  resources :users do
    collection do
      get "search"
    end
  end
  resources :relations do
    member do
      post "follow" 
      post "unfollow"
     end
  end
  resources :ranks do
   collection do
     get "set"
     get "put"
     get "read"
   end
  end
end
