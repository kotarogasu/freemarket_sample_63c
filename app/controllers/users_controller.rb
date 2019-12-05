class UsersController < ApplicationController

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
    @items_on_sale = current_user.items(status: "出品中")
    @items_on_transaction = current_user.items(status: "交渉中")
    @purchased_items = current_user.items(status: "売却済み")

  end


  private

  def address_params

  end

end
