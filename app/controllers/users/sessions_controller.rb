# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    @user = User.new(configure_sign_in_params)
    if @user[:email].blank? or @user[:agreement].blank?
      render 'new' unless @user.valid?(context: :create)
    else
      super do @users 
      end
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    params.require(:user).permit(:email, :password, :agreement)
  end
end
