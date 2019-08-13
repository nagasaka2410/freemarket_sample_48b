class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  before_action :set_user, only: [:identification]

  def index
  end

  def identification
    @user = User.find(params[:id])
  end

  def new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
  end

  def update
    @user = User.find(params[:id])
    @user.update!(user_params)
    redirect_to identification_user_path(current_user)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, user_address_attributes:[:id, :postal_code, :prefecture,  :city, :block_number, :building])
  end


  def user_products
    @products = Product.where(user_id: current_user.id)
  end

end
