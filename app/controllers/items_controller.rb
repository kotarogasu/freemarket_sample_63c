class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  layout :false, only: :new

  def index 
    @items = Item.all
    @pop_category = Category.find(2)

  end

  def category_find
    respond_to do |format| 
      parent = Category.find(params[:category_id])
      @children = parent.children
      format.json
    end
  end

  def new
    @item = Item.new
    render layout: false
  end

  def create
    binding.pry
    @item = @current_user.items.new(item_params)
    - unless image_params == {}
      @item.save! 
      @item.images.create(image_params)
      redirect_to root_path
    else
      redirect_to new_item_path
    end

  end


  private

  def item_params
    params.require(:item).permit(
      :name, 
      :item_text,
      :condition,
      :category_id,
      :prefecture_id,
      :delivery_fee,
      :days,
      :price
    ).merge(user_id: current_user.id)
  end

  def image_params
    params.require(:item).permit(:image)
  end

end
