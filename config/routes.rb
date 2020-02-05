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

  get '/home/product/:product_id', to: 'home#show_product'
  get '/home/product/:product_id/add', to: 'home#add'
  get '/home/product/:product_id/remove', to: 'home#remove'

  get '/home/cart', to: 'home#cart'

  root to: 'home#index'
end
