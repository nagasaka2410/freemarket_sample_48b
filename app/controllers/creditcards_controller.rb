class CreditcardsController < ApplicationController
  # before_action :authenticate_user!

  def index
  end

  def new
    @creditcard = Creditcard.new
  end

  def show
    @creditcard = Creditcard.find(params[:id])
    @user = User.find(params[:id])
  end

  def create
    @creditcard = Creditcard.new(new_params)
    user_id = current_user.id
    if @creditcard.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def new_params
    params.require(:creditcard).permit(:card_number, :valid_month, :valid_year, :security_code).merge(user_id: current_user.id)
  end

end
