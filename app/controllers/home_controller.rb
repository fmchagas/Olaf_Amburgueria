class HomeController < ApplicationController
  skip_before_action :valid_logged_admin

  layout 'site'

  def index
    @products = Product.all
    @products = @products.where(tipe_product_id: params[:tipe_product]) if params[:tipe_product].present?

    options = { page: params[:page] || 1, per_page: 10 }
    @products = @products.paginate(options)
  end
end
