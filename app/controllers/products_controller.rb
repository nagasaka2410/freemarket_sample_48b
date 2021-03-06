class ProductsController < ApplicationController
  before_action :authenticate_user!,only: [:new, :purchase]
  before_action :set_product, only: [:show, :purchase, :bought, :my_show, :edit,:unpublished, :sell, :update, :destroy]
  before_action :show_product, only: [:show, :my_show]

  def index
    @lady_items = Product.includes(:images).where(category_id: Category.find(1).subtree_ids, status: 0).order(created_at: "DESC").limit(4)
    @man_items = Product.includes(:images).where(category_id: Category.find(2).subtree_ids, status: 0).order(created_at: "DESC").limit(4)
    @kids_items = Product.includes(:images).where(category_id: Category.find(3).subtree_ids, status: 0).order(created_at: "DESC").limit(4)
    @beauty_items = Product.includes(:images).where(category_id: Category.find(7).subtree_ids, status: 0).order(created_at: "DESC").limit(4)
    
    @chanel = Product.includes(:images).where(brand_id: 1, status: 0).order(created_at: "DESC").limit(4)
    @nike = Product.includes(:images).where(brand_id: 2, status: 0).order(created_at: "DESC").limit(4)
    @vuitton = Product.includes(:images).where(brand_id: 3, status: 0).order(created_at: "DESC").limit(4)
    @supreme = Product.includes(:images).where(brand_id: 4, status: 0).order(created_at: "DESC").limit(4)
  end
  
  def new
    @product = Product.new
    # @product.images.build
    2.times{@product.images.build}
    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
    end
  end

  def show
    @category_products = Product.where(category_id: @product.category_id).where.not(id: @product.id).order("id DESC").limit(6)
  end

  def my_show
  end

    # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(id: "#{params[:parent_id]}", ancestry: nil).children
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
      selected_child = Category.find(params[:grandchild_id]).parent #孫カテゴリーの親を取得
       if related_size_parent = selected_child.products_sizes[0] #孫カテゴリーの親と紐付くサイズ（親）があれば取得
          @sizes = related_size_parent.children #紐づいたサイズ（親）の子供の配列を取得
       end
    end
  end
  
  def create
    @product = Product.new(product_params)
    if @product.images.first&.name
      @product.save
    else
      redirect_to new_product_path
    end
  end

  def edit
    @category = @product.category
    @child_categories = Category.where('ancestry = ?', "#{@category.parent.ancestry}")
    @grand_child = Category.where('ancestry = ?', "#{@category.ancestry}")
    @parent = @product.category.root.name
  end

  def update
    if @product.update(update_product_params)
      redirect_to my_show_product_path(@product)
    else
      redirect_to edit_product_path
    end
  end

  def purchase
    redirect_to :back if @product.user.id == current_user&.id
  end

  def search
    @products = Product.where('name LIKE(?)',"%#{params[:keyword]}%").page(params[:page]).per(114)
  end

  def bought
    if @product.status == "sell" and @product.buyer_id.nil? == true
      @product.update(status: "sold", buyer_id: current_user.id)
    else
      redirect_to root_path
    end
    if @product.status == "sell" and @product.buyer_id.nil? == true
      @product.update(status: "sold", buyer_id: current_user.id)
    else
      redirect_to root_path
    end
  end

  def unpublished
    if @product.status_sell? and @product.buyer_id.nil? == true
      @product.update(status: "unpublished")
      redirect_to my_show_product_path
    else
      redirect_to root_path
    end
  end

  def sell
    if @product.status == "unpublished"
      @product.update(status: "sell")
      redirect_to my_show_product_path
    else
      redirect_to root_path
    end
  end

  def my_show
    category_id = @product.category_id
    @products = Category.find(category_id).products
    @brand_products = Product.where(brand_id: @product.brand_id).where.not(id: @product.id).order("id DESC").limit(6)
    @user_products = Product.where(user_id: @product.user.id).where.not(id: @product.id).order("id DESC").limit(6)
    @previous_product = @product.previous
    @next_product = @product.next
    @product_comments = ProductComment.new
    @comments = ProductComment.where(product_id: @product.id)
  end

  def destroy
    if @product.user_id == current_user.id
        if @product.destroy
          redirect_to  user_products_users_path, notice: '商品を削除しました'
        end
    else
      render :index
      flash[:alert] = '商品削除に失敗しました'
    end
  end

  private
  def product_params
    params.require(:product).permit(:buyer_id, :brand_id, :category_id, :shipping_date, :name, :description, :status, :price, :condition, :size_id, :shipping_method, :shipping_burden, :shipping_region, images_attributes: [:name]).merge(user_id: current_user.id)
  end

  def update_product_params
    params.require(:product).permit(:buyer_id, :brand_id, :category_id, :shipping_date, :name, :description, :status, :price, :condition, :size_id, :shipping_method, :shipping_burden, :shipping_region, images_attributes: [:name, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def show_product
    category_id = @product.category_id
    @products = Category.find(category_id).products
    @brand_products = Product.where(brand_id: @product.brand_id).where.not(id: @product.id).order("id DESC").limit(6)
    @user_products = Product.where(user_id: @product.user.id).where.not(id: @product.id).order("id DESC").limit(6)
    @previous_product = @product.previous
    @next_product = @product.next
    @product_comments = ProductComment.new
    @comments = ProductComment.where(product_id: @product.id)
  end
end
