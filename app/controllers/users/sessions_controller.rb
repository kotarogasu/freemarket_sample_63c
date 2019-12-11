# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  # GET /resource/sign_in
  # def new
  #   @user = User.new
  #   binding.pry
  # end

  def create
    @user = User.new(configure_sign_in_params)
    if @user[:email].blank?
      render 'new' unless @user.valid?
      binding.pry
    if
     @user[:password].blank? 
     render 'new' unless @user.errors.full_messages_for(:password)
     binding.pry
   elsif
     @user[:agreement].blank?
     render 'new' unless @user.errors.full_messages_for(:agreement)
     binding.pry
   else
      super do @users
      end
   end
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    params.require(:user).permit(:email, :password, :agreement)
  end
end
