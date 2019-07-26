class BrandsController < ApplicationController
  def index
    @brand = Brand.order("id ASC")
  end
end
