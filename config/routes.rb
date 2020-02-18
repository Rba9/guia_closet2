Rails.application.routes.draw do
  get 'users', to:'users#index'
  resources :albums
  devise_for :users
  root 'albums#index'
end
