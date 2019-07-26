class ProductsController < ApplicationController
  def index
    @lady_items = Product.includes(:images).where(category_id: Category.find(1).subtree_ids, status: 0).order(created_at: "DESC").limit(4)
    @man_items = Product.includes(:images).where(category_id: Category.find(2).subtree_ids, status: 0).order(created_at: "DESC").limit(4)
    @kids_items = Product.includes(:images).where(category_id: Category.find(3).subtree_ids, status: 0).order(created_at: "DESC").limit(4)
    @beauty_items = Product.includes(:images).where(category_id: Category.find(7).subtree_ids, status: 0).order(created_at: "DESC").limit(4)
    
    @chanel = Product.includes(:images).where(brand_id: 1, status: 0).order(created_at: "DESC").limit(4)
    @vuitton = Product.includes(:images).where(brand_id: 2, status: 0).order(created_at: "DESC").limit(4)
    @supreme = Product.includes(:images).where(brand_id: 3, status: 0).order(created_at: "DESC").limit(4)
    @nike = Product.includes(:images).where(brand_id: 4, status: 0).order(created_at: "DESC").limit(4)
  end
  
  def new

  end

  def confirm

  end
end
