class CategoriesController < ApplicationController
  def index
    @parents = Category.all.order("id ASC").limit(13)
  end

  def show
    @category= Category.find(params[:id])
    categoryIds = get_category(@category)
    @products = Product.where(category_id: categoryIds).includes(:images, :user)
  end

  private
  def get_category(category)
    if category.indirect_ids.present?
      categoryIds = category.indirect_ids
    elsif category.children.present?
      categoryIds = category.children
    else
      categoryIds = category
    end
    return categoryIds
  end
end
