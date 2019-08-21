class ProductCommentsController < ApplicationController
  before_action :set_product, only:[:create, :my_product_comments]

  def create
    @comment = @product.product_comments.new(comment_params)
    if @comment.save
      redirect_to product_path(@product)
    else
      render :create
    end
  end

  def my_product_comments
    @comment = @product.product_comments.new(comment_params)
    if @comment.save
      redirect_to my_show_product_path(@product)
    else
      render :my_product_comments
    end
  end

  private
  def set_product
    @product = Product.find(params[:product_id])
  end

  def comment_params
    params.require(:product_comment).permit(:comment, :user_id, :product_id).merge(user_id: current_user.id, product_id: @product.id)
  end
end
