class ProductsController < ApplicationController
  def index
    @parents = Category.all.order("id ASC").limit(13)
  end
  
  def new

  end

  def confirm

  end
end
