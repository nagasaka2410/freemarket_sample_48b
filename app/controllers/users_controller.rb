class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new]

  def index
  end

  def identification
    @user = User.new
  end

  def new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update

  end


  def user_products
    @products = Product.where(user_id: current_user.id)
  end

end
