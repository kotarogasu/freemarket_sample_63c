class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index 
    @items = Item.all
  end

  def new
    @item = Item.new
    render layout: false
  end

  def create
    @item = @current_user.items.new(item_params)
    image = @item.images.new(images_params)

    if @item.save
      redirect_to root_path
    else
      render 'items/new'
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

  def images_params
    params.require(:item).permit(:image)
  end

end
