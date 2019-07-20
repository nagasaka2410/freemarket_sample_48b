class ProductsController < ApplicationController
  def index
    @products = Product.all
    @parents = Category.order("id ASC").limit(13)
  end
  
  def new

  end

  def confirm

  end
end
