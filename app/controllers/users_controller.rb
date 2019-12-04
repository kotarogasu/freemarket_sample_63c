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

    @items_on_sale = current_user.items.where(status: 1)
    @items_on_transaction = current_user.items.where(status: 2)
    @purchased_items = current_user.items.where(status: 3)

  end


  private

  def address_params

  end

end
