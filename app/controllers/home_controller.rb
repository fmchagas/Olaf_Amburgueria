class HomeController < ApplicationController
  skip_before_action :valid_logged_admin

  layout 'site'

  def index
    @products = Product.all
  end
end
