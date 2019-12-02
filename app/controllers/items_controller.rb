class ItemsController < ApplicationController
  before_action :set_current_user, except: :index
  layout :false, only: :new


  def index 
    @items = Item.all
    @category = Category.find(1)
  end

  def new
    @item = Item.new
    render layout: false
  end

  def create
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
