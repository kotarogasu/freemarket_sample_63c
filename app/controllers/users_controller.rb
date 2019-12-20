class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_buy, only: [:mypage, :shopping,]

  def mypage
  end


  def profile
  end

  def identification
    @address = Address.new
  end

  def address
    @address = _user.address.new(address_params)
  end

  def listing
    @items = current_user.items.recent.page(params[:page]).per(5) 
    @items_on_sale = @items.出品中
    @items_on_transaction = @items.取引中
    @sold_items = @items.購入済み
  end

  def shopping
  end


  private

  def address_params
  end

  def set_buy
    @buy_items = Item.where(status: 4,buyer_id: current_user.id)
  end

end