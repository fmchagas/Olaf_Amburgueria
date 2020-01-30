Rails.application.routes.draw do
  
  resources :customers
  root to: 'home#index'
  get '/home', to: 'home#index'

  resources :tipe_products
  resources :products
end
