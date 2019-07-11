class UserProfilesController < ApplicationController
  
  def edit
    @user = User.find(params[:id])
  end

  def update

  end
end
