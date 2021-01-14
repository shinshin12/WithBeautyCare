Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :informations do
    resources :comments, only: :create
    collection do
      get "search"
    end
  end
  resources :users
end
