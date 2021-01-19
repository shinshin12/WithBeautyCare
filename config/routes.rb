Rails.application.routes.draw do
  devise_for :users
  root to: "users#index" 
  resources :informations do 
   resources :comments, only: :create
   resources :likes, only: [:create, :destroy]
  end
  post 'follow/:id' => 'relations#follow', as: 'follow' 
  post 'unfollow/:id' => 'relations#unfollow', as: 'unfollow' 
  resources :users do 
    collection do
      get "search"
    end
  end
  resources :ranks, only: :index
end
