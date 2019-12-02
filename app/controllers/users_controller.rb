class UsersController < ApplicationController

  def profile
  end

  def identification
    @address = Address.new
  end

  def address
    @address = @current_user.address.new(address_params)
  end

  private

  def address_params

  end

end
