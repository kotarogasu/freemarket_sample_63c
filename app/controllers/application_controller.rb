class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :set_current_user

  protect_from_forgery with: :exception

  layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller?
      "devise"
    elsif
      "signup"
    else
      "application"
    end
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday])
  end

  private
  
  def production?
    Rails.env.production?
  end
  
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
  
  # def set_current_user
  #   @current_user = User.find(session[:user_id])
  # end
  

end