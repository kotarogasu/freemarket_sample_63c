class UsersController < ApplicationController
  before_action :set_buy, only: [:mypage, :shopping]

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
    @items_on_sale = current_user.items.出品中
    @items_on_transaction = current_user.items.取引中
    @purchased_items = current_user.items.売却済み
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