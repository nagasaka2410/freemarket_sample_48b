class UsersController < ApplicationController

  def index
  end

  def identification
    @user = User.new
  end


end
