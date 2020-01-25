class TipeProductsController < ApplicationController
  before_action :set_tipe_product, only: [:show, :edit, :update, :destroy]

  # GET /tipe_products
  # GET /tipe_products.json
  def index
    @tipe_products = TipeProduct.all
  end

  # GET /tipe_products/1
  # GET /tipe_products/1.json
  def show
  end

  # GET /tipe_products/new
  def new
    @tipe_product = TipeProduct.new
  end

  # GET /tipe_products/1/edit
  def edit
  end

  # POST /tipe_products
  # POST /tipe_products.json
  def create
    @tipe_product = TipeProduct.new(tipe_product_params)

    respond_to do |format|
      if @tipe_product.save
        format.html { redirect_to @tipe_product, notice: 'Tipe product was successfully created.' }
        format.json { render :show, status: :created, location: @tipe_product }
      else
        format.html { render :new }
        format.json { render json: @tipe_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipe_products/1
  # PATCH/PUT /tipe_products/1.json
  def update
    respond_to do |format|
      if @tipe_product.update(tipe_product_params)
        format.html { redirect_to @tipe_product, notice: 'Tipe product was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipe_product }
      else
        format.html { render :edit }
        format.json { render json: @tipe_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipe_products/1
  # DELETE /tipe_products/1.json
  def destroy
    @tipe_product.destroy
    respond_to do |format|
      format.html { redirect_to tipe_products_url, notice: 'Tipe product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipe_product
      @tipe_product = TipeProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipe_product_params
      params.require(:tipe_product).permit(:name)
    end
end
