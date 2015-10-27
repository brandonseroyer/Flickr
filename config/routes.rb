Rails.application.routes.draw do

  devise_for :users
  root 'posts#index'

  resources :posts do
    resources :comments
  end

  resources :posts do
    resources :upvotes, only: [:create, :destroy]
  end

  resources :comments

  namespace :admin do
    resources :users
  end

  resources :tags

end
