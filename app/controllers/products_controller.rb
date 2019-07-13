class ProductsController < ApplicationController
  def index
    
  end
  
  def new
    @product = Product.new
  end

  def confirm

  end

  def create
    @product = Product.new(item_params)
  end
end
