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

  get '/ecomerce/product/:product_id', to: 'ecomerce#show_product'
  get '/ecomerce/cart/:product_id/add', to: 'ecomerce#add'
  get '/ecomerce/cart/:product_id/remove', to: 'ecomerce#remove'
  get '/ecomerce/cart', to: 'ecomerce#cart'
  get '/ecomerce/cart/pay', to: 'ecomerce#pay'

  root to: 'home#index'
end
