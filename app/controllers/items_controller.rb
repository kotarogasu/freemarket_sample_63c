class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show, :show_user_item, :destroy, :image_edit]
  before_action :authenticate_user!, except: [:index, :show]



  def index 
    if user_signed_in?
      @items = Item.where.not(user_id:current_user.id,status:4)
      @chanel_items = Brand.search("シャネル").items.where.not(user_id:current_user.id,status:4).limit(10)
      @louisvuitton_items = Brand.search("ルイヴィトン").items.where.not(user_id:current_user.id,status:4).limit(10)
      @supreme_items = Brand.search("スプリーム").items.where.not(user_id:current_user.id,status:4).limit(10)
      @nike_items = Brand.search("ナイキ").items.where.not(user_id:current_user.id,status:4).limit(10)
    else
      @items = Item.where.not(status:4)
      @chanel_items = Brand.search("シャネル").items.where.not(status:4).limit(10)
      @louisvuitton_items = Brand.search("ルイヴィトン").items.where.not(status:4).limit(10)
      @supreme_items = Brand.search("スプリーム").items.where.not(status:4).limit(10)
      @nike_items = Brand.search("ナイキ").items.where.not(status:4).limit(10)
    end
    @ladies_items = @items.get_ladies.limit(10)
    @mens_items = @items.get_mens.limit(10)
    @electronics_items = @items.get_electronics.limit(10)
    @hobbies_items = @items.get_hobbies.limit(10)
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
    10.times{@item.images.build}
    render layout: false
  end

  def create
    @item = current_user.items.new(item_params)
    @item.set_fee_profit unless @item.price == nil
    if @item.save
      redirect_to root_path
    else  
      10.times{@item.images.build}
      render :new, layout: false
    end
  end
 
  def edit
    @images = @item.images
    (10 - @images.length).times{@item.images.build}
    render layout: false
  end

  def update
    if @item.update(item_params)
      @item.set_fee_profit unless @item.price == nil
      redirect_to show_user_item_item_path(@item)
    else
      @images = @item.images
      (10 - @images.length).times{@item.images.build}
      render :edit, layout: false
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
        :delivery_method,
        :buyer_id,
        images_attributes: [:image, :id, :_destroy]
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
        :delivery_method,
        :buyer_id,
        images_attributes: [:image, :id, :_destroy]  
      ).merge(user_id: current_user.id, brand_id: @brand.id)
    end
  end

  # def image_params
  #   params.require(:images).to_h
  # end

  def image_params
    params.require(:images).map do |u|
      ActionController::Parameters.new(u.to_h).permit(:image)
    end
  end

  def set_category
    
  end

end
