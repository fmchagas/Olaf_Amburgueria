class EcomerceController < ApplicationController
  skip_before_action :valid_logged_admin

  layout 'site'

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

    redirect_to '/ecomerce/cart'
  end

  def cart
    if cookies[:cart].blank?
      redirect_to '/'
      return
    end

    products = JSON.parse(cookies[:cart])
    @products = Product.where(id: products)
  end

  def pay
    if cookies[:cart].blank?
      redirect_to '/'
      return
    end

    products = JSON.parse(cookies[:cart])
    @products = Product.where(id: products)
  end
end
