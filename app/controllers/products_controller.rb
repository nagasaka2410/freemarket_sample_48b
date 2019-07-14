class ProductsController < ApplicationController
  def index
    
  end
  
  def new
    @product = Product.new
    @product.images.build
  end

  def confirm

  end

  def create
    @product = Product.new(product_params)
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :user_id, :status, :price, :condition, :product_size, :shippoing_method, :shipping_burden, :created_at, :updated_at,)
  end

end
