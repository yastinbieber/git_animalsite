Rails.application.routes.draw do
  
  devise_for :users
  root 'tops#index'
  resources :tops, only: [:index, :show]
  resources :tweets do
    resources :comments, only: [:create]
  end
  resources :locates do
    resources :locatecomments, only: [:create]
  end
  resources :keeps do
    resources :keepcomments, only: [:create]
  end
  resources :users, only: [:show, :edit, :update]
end