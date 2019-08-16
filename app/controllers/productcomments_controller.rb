class ProductcommentsController < ApplicationController
  before_action :set_product

  def create
    @comment = @product.product_comments.new(comment_params)
    @comment.save
    redirect_to product_path(@product)
  end


  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def comment_params
    params.require(:product_comment).permit(:comment, :user_id, :product_id).merge(user_id: current_user.id, product_id: @product.id)
  end
end
