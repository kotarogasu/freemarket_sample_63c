class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
      
  def facebook
    callback_from :facebook
  end
  
  def google_oauth2
    callback_from :google
  end

  private
  
  def callback_from(provider)
    provider = provider.to_s

    @user = User.from_omniauth(request.env['omniauth.auth'])
    if 
      @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      sign_in(@user)
      redirect_to root_path(@user), event: :authentication
    else
      session["devise.provider_data"] = request.env['omniauth.auth'].except(:extra)
      session[:password] = @user.password
      redirect_to '/signup/user_registration'
    end
  end
end