class CreditcardsController < ApplicationController

  def new
    @creditcard = Creditcard.new
  end

  def show
    render :new
  end

  def create
    @creditcard = Creditcard.new(new_params)
    user_id = current_user.id
    if @creditcard.save
      redirect_to complete_users_path
    else
      render :new
    end
  end

  private
  def new_params
    params.require(:creditcard).permit(:card_number, :valid_month, :valid_year, :security_code).merge(user_id: current_user.id)
  end

end
