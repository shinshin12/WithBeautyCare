Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  resources :informations do 
    collection do
      get "search"
    end
  
   resources :comments, only: :create
   resources :likes, only: [:create, :destroy]
  end
  resources :users 
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
