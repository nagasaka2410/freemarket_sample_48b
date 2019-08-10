class CreditcardsController < ApplicationController
  before_action :authenticate_user!

  def index
    card = current_user.creditcard
    redirect_to creditcard_path(card) unless card.blank?
  end

  def new
    @creditcard = Creditcard.new
  end

  def show
    @creditcard = Creditcard.find(params[:id])
    if @creditcard.blank?
      redirect_to action: "new" 
    end
  end

  def create
    @creditcard = Creditcard.new(new_params)
    user_id = current_user.id
    if @creditcard.save
      redirect_to creditcards_path
    else
      render :new
    end
  end

  def destroy
    @creditcard = Creditcard.find(params[:id])
    if @creditcard.blank?
      redirect_to action: "new"
    else
      @creditcard.delete if @creditcard.user_id == current_user.id
      redirect_to creditcards_path
    end
  end

  private
  def new_params
    params.require(:creditcard).permit(:card_number, :valid_month, :valid_year, :security_code).merge(user_id: current_user.id)
  end

end
