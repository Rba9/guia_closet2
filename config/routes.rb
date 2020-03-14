Rails.application.routes.draw do
  resources :posts
  get 'guide/index'
  get 'users', to:'users#index'
  resources :albums
  resources :products
  devise_for :users
  root 'guide#index'
end
