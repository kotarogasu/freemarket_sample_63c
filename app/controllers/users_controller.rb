class UsersController < ApplicationController
  before_action :set_current_user
  def mypage
  end

  def profile
  end

  def identification
    @address = Address.new
  end

  def address
    @address = @current_user.address.new(address_params)
  end

  def listing
    
  end

  private

  def address_params

  end

end
