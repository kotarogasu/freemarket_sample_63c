class UsersController < ApplicationController

  def profile
  end

  def credit
  end

  def identification
    @address = Address.new
    @user = @current_user
  end

  def identification_2
    @address = @current_user.address.new(address_params)
  end

  private

  def address_params

  end

end
