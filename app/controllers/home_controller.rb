class HomeController < ApplicationController
  skip_before_action :valid_logged_admin

  layout 'site'

  def index
    @products = Product.all
    @products = @products.where(tipe_product_id: params[:tipe_product]) if params[:tipe_product].present?

    options = { page: params[:page] || 1, per_page: 10 }
    @products = @products.paginate(options)
  end

  def show_product
    @product = Product.find(params[:product_id])
  end

  def add
    if cookies[:cart].present?
      products = JSON.parse(cookies[:cart])
    else
      products = []
    end

    products << params[:product_id]
    products.uniq!

    cookies[:cart] = { value: products.to_json, expires: 1.year.from_now, httponly: true }

    redirect_to '/'
  end

  def remove
    if cookies[:cart].blank?
      redirect_to '/'
      return
    end

    products = JSON.parse(cookies[:cart])
    products.delete(params[:product_id])

    cookies[:cart] = { value: products.to_json, expires: 1.year.from_now, httponly: true }

    redirect_to '/home/cart'
  end

  def cart
    if cookies[:cart].blank?
      redirect_to '/'
      return
    end

    products = JSON.parse(cookies[:cart])
    @products = Product.where(id: products)
  end
end
