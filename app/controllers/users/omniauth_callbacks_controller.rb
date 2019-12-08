class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
      
  def facebook
    callback_from :facebook
    binding.pry
  end
  
  def google_oauth2
    callback_from :google
    binding.pry
  end

  private
  
  def callback_from(provider)
    provider = provider.to_s

    @user = User.from_omniauth(request.env['omniauth.auth'])

    if 
      binding.pry
      @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.#{provider}_data"] = request.env['omniauth.auth'].except(:extra)
      binding.pry
      redirect_to '/signup/user_registration'
    end
  end
end