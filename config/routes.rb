Rails.application.routes.draw do
  resources :administrators
  resources :orders do
    resources :order_items
  end

  resources :customers
  
  resources :tipe_products
  resources :products

  get '/admin', to: 'admin#index'
  get '/login', to: 'login#index'
  post '/login/logar', to: 'login#logar'
  get '/login/logout', to: 'login#logout'

  root to: 'home#index'
end
