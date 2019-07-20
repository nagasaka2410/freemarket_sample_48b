class ProductsController < ApplicationController
  def index
    @products = Product.all
    @parents = Category.order("id ASC").limit(13)
  end
  
  def new
    @product = Product.new
    @product.images.build
  end

  def confirm

  end

  def search
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path, method: :post
    end
  end

  private

  def product_params
    params.require(:product).permit(:category_id, :shipping_date,:name, :description, :user_id, :status, :price, :condition, :product_size, :shippoing_method, :shipping_burden, :created_at, :updated_at,)
  end

end
