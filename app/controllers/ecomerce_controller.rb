class EcomerceController < ApplicationController
  skip_before_action :valid_logged_admin
  skip_before_action :verify_authenticity_token
  before_action :set_customer, only: [:show, :edit, :update]

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
    if cookies[:customer_login].blank?
      redirect_to '/customer/logar'
      return
    end

    if cookies[:cart].present?
      products = JSON.parse(cookies[:cart])
      @products = Product.where(id: products)
    else
      @products = []
    end
  end

  def login
    customers = Customer.where(email: params[:email], password: params[:password])
    if `customers.count > 0`

      customer = customers.first
      time = params[:remember] == '1' ? 1.year.from_now : 30.minutes.from_now
      value = {
        id: customer.id,
        name: customer.name,
        email: customer.email
      }
      cookies[:customer_login] = { value: value.to_json, expires: time, httponly: true }

      redirect_to '/ecomerce/cart/pay'
    else
      flash[:error] = 'email ou senha inválidos'
      redirect_to '/customer/logar'
    end
  end

  def new
    if cookies[:customer_login].blank?
      @customer = Customer.new
    else
      c = JSON.parse(cookies[:customer_login])
      @customer = Customer.find(c["id"])
    end
  end

  def logout
    cookies[:customer_login] = nil
    redirect_to '/'
  end

  def create
    if cookies[:customer_login].blank?
      @customer = Customer.new(customer_params)
      if @customer.save
        cookies[:customer_login] = {
          value: {
            id: @customer.id,
            name: @customer.name,
            email: @customer.email
          }.to_json,
          expires: 1.year.from_now, httponly: true }

        redirect_to '/ecomerce/cart/pay'
      else
        #flash[:error] = 'Erro ao cadastrar'
        #redirect_to '/customer/new'
        render :new
      end
    else
      c = JSON.parse(cookies[:customer_login]);
      @customer = Customer.find(c["id"])
      if @customer.update(customer_params)
        cookies[:customer_login] = {
          value: {
            id: @customer.id,
            name: @customer.name,
            email: @customer.email
          }.to_json,
          expires: 1.year.from_now, httponly: true
        }
        flash[:success] = 'Dados atualizados'
        redirect_to '/customer/new'
      else
        render :new
      end
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :cpf, :phone, :email, :address, :number, :district, :zip, :city, :state, :password)
  end
end
