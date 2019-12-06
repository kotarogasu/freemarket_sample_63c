class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item, only: [:edit, :update, :show, :show_user_item, :destroy]


  def index 
    @items = Item.all
    @ladies_items = Item.get_ladies
    @mens_items = Item.get_mens
    @electronics_items = Item.get_electronics
    @hobbies_items = Item.get_hobbies
    @chanel_items = Brand.search("シャネル").items
    @louisvuitton_items = Brand.search("ルイヴィトン").items
    @supreme_items = Brand.search("スプリーム").items
    @nike_items = Brand.search("ナイキ").items
  end

  def category_find
    respond_to do |format| 
      parent = Category.find(params[:category_id])
      @children = parent.children
      format.json
    end
  end

  def brand_find
    respond_to do |format| 
      return nil if params[:keyword] == ""
      @brands = Brand.where(['name LIKE ?', "%#{params[:keyword]}%"] ).limit(5)
      format.json
    end
  end

  def new
    @item = Item.new
    @image = Image.new
    render layout: false
  end

  def create
    @item = current_user.items.new(item_params)
    @item.set_fee_profit unless @item.price == nil
    @image = @item.images.new(image_params)
    if @item.save && @image.save
      redirect_to root_path
    else   
      render :new, layout: false
    end
  end
 

  def edit
    @image = @item.images.first
    render layout: false
  end

  def update
    @item.update(item_params)
    @item.set_fee_profit
    if @item.save
      unless image_params == {}
        @item.images.update(image_params)
      end
      redirect_to show_user_item_item_path(@item)
    else
      render :edit
    end
  end

  def show
    @user = @item.user
    @prefecture = Prefecture.find(@item.prefecture_id)
    @brand = Brand.find(@item.brand_id)
  end

  def show_user_item
    @brand = @item.brand
    @prefecture = Prefecture.find(@item.prefecture_id)
    @user = current_user
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private


  def set_item
    @item = Item.find(params[:id])
  end
  def item_params
    if params[:brand_name] == ""
      params.require(:item).permit(
        :name, 
        :item_text,
        :condition,
        :category_id,
        :prefecture_id,
        :delivery_fee,
        :days,
        :price,
        :delivery_method
      ).merge(user_id: current_user.id)
    else 
      @brand = Brand.search(params[:brand_name])
      params.require(:item).permit(
        :name, 
        :item_text,
        :condition,
        :category_id,
        :prefecture_id,
        :delivery_fee,
        :days,
        :price,
        :delivery_method
      ).merge(user_id: current_user.id, brand_id: @brand.id)
    end
  end

  def image_params
    params.require(:item).permit(:image)
  end

end
