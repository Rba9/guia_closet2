Rails.application.routes.draw do
  get 'orders/index'
  resources :billings, only: [] do
    collection do
      get 'pre_pay'
      get 'execute'
    end
  end
  get 'guide/index'
  get 'users', to:'users#index'
  resources :albums
  resources :products do
    resources :orders, only: :create
  end
  resources :orders, only: :index do
  	collection do
  		get 'clean'
  	end
  end
  devise_for :users
  root 'guide#index'
end
