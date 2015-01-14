class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(:code_id => params[:code_id], :product_image => params[:product_image], :price => params[:price])
  
    if @product.save
      redirect_to products_path
      else
      reirect_to :back
    end
  end

  def edit

  end

  private
    def product_params
      params.require(:product).
        permit(:code_id, :product_image, :price)
    end

end
