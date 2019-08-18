class Api::ProductsController < ApplicationController
  def image_destroy
    image = Image.find(params[:img_id])
    if image.product.user_id == current_user.id
      image.destroy
    end
  end
end
