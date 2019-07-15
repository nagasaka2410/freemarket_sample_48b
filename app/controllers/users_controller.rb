class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def identification
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update

  end

end
