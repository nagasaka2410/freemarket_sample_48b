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
    @product = Product.new
    2.times{@product.images.build}
  end

    # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(id: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def get_size
    selected_grandchild = Category.find("#{params[:grandchild_id]}") #孫カテゴリーを取得
    if related_size_parent = selected_grandchild.products_sizes[0] #孫カテゴリーと紐付くサイズ（親）があれば取得
       @sizes = related_size_parent.children #紐づいたサイズ（親）の子供の配列を取得
    else
       selected_child = Category.find("#{params[:grandchild_id]}").parent #孫カテゴリーの親を取得
       if related_size_parent = selected_child.products_sizes[0] #孫カテゴリーの親と紐付くサイズ（親）があれば取得
          @sizes = related_size_parent.children #紐づいたサイズ（親）の子供の配列を取得
       end
    end
 end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def purchase
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:brand_id, :category_id, :shipping_date, :name, :description, :status, :price, :condition, :size_id, :shipping_method, :shipping_burden, :shipping_region, images_attributes: [:name]).merge(user_id: current_user.id)
  end

end
