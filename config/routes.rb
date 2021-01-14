Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :informations do
    resources :comments, only: :create
  end
  resources :users
  collection do
    get 'search'
  end
end
