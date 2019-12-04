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
    
  end

  private

  def address_params

  end

end
