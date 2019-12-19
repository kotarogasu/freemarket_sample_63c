class SignupController < ApplicationController
  before_action :validates_user_registration, only: :sms_confirmation # user_registrationのバリデーション
  before_action :validates_sms_confirmation, only: :address # sms_confirmationのバリデーション
  before_action :validates_address, only: :card_new # addressのバリデーション

  def social_choice
    reset_session
    @user = User.new
  end

  def user_registration
    if session["devise.provider_data"].blank?
      @user = User.new
    else
    @user = User.new(
    nickname: session["devise.provider_data"]["info"]["name"],
    email: session["devise.provider_data"]["info"]["email"],
    last_name: session["devise.provider_data"]["info"]["last_name"],
    first_name: session["devise.provider_data"]["info"]["first_name"],
    last_name_kana: session["devise.provider_data"]["info"]["last_name_kana"],
    first_name_kana: session["devise.provider_data"]["info"]["first_name_kana"],
    birthday: session["devise.provider_data"]["info"]["birthday"],
    phone_number: session["devise.provider_data"]["info"]["phone_number"]
    )
    end
  end


  def sms_confirmation
    @user = User.new
  end

  def address
    @address = Address.new
  end

  def card_new
  end

  def card_create #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.create(
      description: '登録テスト', #なくてもOK
      card: params['payjp-token'],
      ) 
      @@card = Card.new(customer_id: customer.id, card_id: customer.default_card)
      if @@card.save
        redirect_to action: "complete"
      else
        redirect_to action: "card_new"
      end
  end
  
  def complete
    @user = User.new
    @address = Address.new
  end

  def validates_user_registration
    if session[:password].blank?
      params[:user][:birthday] = birthday_join(params[:birthday])
      session[:nickname] = user_params[:nickname]
      session[:email] = user_params[:email]
      session[:password] = user_params[:password]
      session[:last_name] = user_params[:last_name]
      session[:first_name] = user_params[:first_name]
      session[:last_name_kana] = user_params[:last_name_kana]
      session[:first_name_kana] = user_params[:first_name_kana]
      session[:birthday] = user_params[:birthday]
      session[:agreement] = user_params[:agreement]
      @user = User.new(
        nickname: session[:nickname],
        email: session[:email],
        password: session[:password],
        last_name: session[:last_name],
        first_name: session[:first_name],
        last_name_kana: session[:last_name_kana],
        first_name_kana: session[:first_name_kana],
        birthday: session[:birthday],
        phone_number: '090XXXXXXXX',
        agreement: session[:agreement]
      )

    render '/signup/user_registration' unless @user.valid?
    else
      params[:user][:birthday] = birthday_join(params[:birthday])
      session[:nickname] = user_params[:nickname]
      session[:email] = user_params[:email]
      session[:last_name] = user_params[:last_name]
      session[:first_name] = user_params[:first_name]
      session[:last_name_kana] = user_params[:last_name_kana]
      session[:first_name_kana] = user_params[:first_name_kana]
      session[:birthday] = user_params[:birthday]
      session[:agreement] = user_params[:agreement]
      @user = User.new(
        nickname: session[:nickname],
        email: session[:email],
        password: session[:password],
        last_name: session[:last_name],
        first_name: session[:first_name],
        last_name_kana: session[:last_name_kana],
        first_name_kana: session[:first_name_kana],
        birthday: session[:birthday],
        phone_number: '090XXXXXXXX',
        agreement: session[:agreement]
      )

    render '/signup/user_registration' unless @user.valid?
    end
  end

  def validates_sms_confirmation
    session[:phone_number] = user_params[:phone_number]
    @user = User.new(
      nickname: session[:nickname], 
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday: session[:birthday],
      phone_number: session[:phone_number],
      agreement: session[:agreement]
     )
     render '/signup/sms_confirmation' unless @user.valid?

  end

  def validates_address
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:post_number] = params[:user][:address][:post_number]
    session[:prefecture_id] = params[:user][:address][:prefecture_id]
    session[:city] = params[:user][:address][:city]
    session[:town] = params[:user][:address][:town]
    session[:building] = params[:user][:address][:building]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday: session[:birthday],
      phone_number: session[:phone_number],
      agreement: session[:agreement]
    )
    @address = Address.new(
      post_number: session[:post_number],
      prefecture_id: session[:prefecture_id],
      city: session[:city],
      town: session[:town],
      building: session[:building]
    )
    render '/signup/address' unless @address.valid? && @user.valid?
  end

  def create
    if not session["devise.provider_data"].blank?
      @user = User.new(
        nickname: session[:nickname],
        email: session[:email],
        password: session[:password],
        last_name: session[:last_name],
        first_name: session[:first_name],
        last_name_kana: session[:last_name_kana],
        first_name_kana: session[:first_name_kana],
        birthday: session[:birthday],
        phone_number: session[:phone_number],
        agreement: session[:agreement],
        uid: session["devise.provider_data"]['uid'],
        provider: session["devise.provider_data"]['provider']
        )
    else
      @user = User.new(
        nickname: session[:nickname],
        email: session[:email],
        password: session[:password],
        last_name: session[:last_name],
        first_name: session[:first_name],
        last_name_kana: session[:last_name_kana],
        first_name_kana: session[:first_name_kana],
        birthday: session[:birthday],
        phone_number: session[:phone_number],
        agreement: session[:agreement]
        )
    end
    @address = Address.new(
      post_number: session[:post_number],
      prefecture_id: session[:prefecture_id],
      city: session[:city],
      town: session[:town],
      building: session[:building]
    )
    @user.save
    if @user.save
      @@card[:user_id] = @user.id
      @@card.save
      @address[:user_id] = @user.id
      @address.save
      reset_session
      session[:user_id] = @user.id
      sign_in(@user)
      redirect_to root_path(@user)
    else
      render '/signup/social_choice'
    end
  end

  def logout
  end  

  def destroy
    reset_session
    redirect_to root_url
  end


  
  private
    def user_params
      params.require(:user).permit(
        :nickname,
        :email,
        :password,
        :password_confirmation,
        :last_name,
        :first_name,
        :last_name_kana,
        :first_name_kana,
        :birthday,
        :phone_number,
        :agreement
      )
    end

    def address_params
      params.require(:user, :address).permit(
        :id,
        :post_number, 
        :prefecture, 
        :city, 
        :town, 
        :building
      )
    end

    def provider_params
      params.require(:user).permit(
        :nickname,
        :email,
        # :password,
        # :password_confirmation,
        # :last_name,
        # :first_name,
        # # :last_name_kana,
        # # :first_name_kana,
        # # :birthday,
        # # :phone_number,
        # :uid,      
        # :provider
      )
    end

    def birthday_join(params)
      date = params
      if date["birthday(1i)"].empty? && date["birthday(2i)"].empty? && date["birthday(3i)"].empty?
        return
      end

        begin
          params[:birthday] = Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i
        rescue
          return false
        end
    end

end
