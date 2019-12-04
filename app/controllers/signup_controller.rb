class SignupController < ApplicationController

  def step1
    @user = User.new
  end

  def step2
    @user = User.new
  end


  def step3
    params[:user][:birthday] = birthday_join(params[:birthday])
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthday] = user_params[:birthday]
    @user = User.new
  end

  def step4
    session[:phone_number] = user_params[:phone_number]
    @user = User.new
  end

  def step5
  end

  def card_create #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.create(
      description: '登録テスト', #なくてもOK
      card: params['payjp-token'],
      ) 
      @@card = Card.new(customer_id: customer.id, card_id: customer.default_card)
      if @@card.save
        redirect_to action: "done"
      else
        redirect_to action: "step5"
      end
  end

  def done
    @user = User.new
  end

  def create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email], # sessionに保存された値をインスタンスに渡す
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday: session[:birthday],
      phone_number: session[:phone_number]
    )
    if @user.save
      session[:id] = @user.id
      @@card[:user_id] = @user.id
      @@card.save
      sign_in(@user)
      redirect_to root_path(@user)
    else
      render '/signup/step1'
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
        :phone_number
      )
    end

    def birthday_join(params)
      date = params
      if date["birthday(1i)"].empty? && date["birthday(2i)"].empty? && date["birthday(3i)"].empty?
        return
      end

      params[:birthday] = Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i
    end
end
