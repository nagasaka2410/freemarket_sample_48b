class CreditcardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_creditcard, only: [:show, :destroy]

  def index
    card = current_user.creditcard
    redirect_to creditcard_path(card) unless card.blank?
  end

  def new
    @creditcard = Creditcard.new
  end

  def show
    redirect_to action: "new" if @creditcard.blank?
  end

  def create
    @creditcard = Creditcard.new(new_params)
    if @creditcard.save
      redirect_to creditcards_path
    else
      render :new
    end
  end

  def destroy
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

  def set_creditcard
    @creditcard = Creditcard.find(params[:id])
  end
end
