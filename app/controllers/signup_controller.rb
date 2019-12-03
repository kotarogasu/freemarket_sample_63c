class SignupController < ApplicationController
  before_action :validates_step2, only: :step3 # step1のバリデーション
  before_action :validates_step3, only: :step4 # step2のバリデーション
  before_action :validates_step4, only: :done # step2のバリデーション

  def social_choice
    @user = User.new
  end

  def user_registration
    @user = User.new
  end


  def sms_confirmation
    @user = User.new
  end

  def address
    @user = User.new
    @address = Address.new
  end

  def complete
    @user = User.new
    @address = Address.new
  end

 def validates_step2
   # step1で入力された値をsessionに保存
   params[:user][:birthday] = birthday_join(params[:birthday])
   session[:nickname] = user_params[:nickname]
   session[:email] = user_params[:email]
   session[:password] = user_params[:password]
   session[:last_name] = user_params[:last_name]
   session[:first_name] = user_params[:first_name]
   session[:last_name_kana] = user_params[:last_name_kana]
   session[:first_name_kana] = user_params[:first_name_kana]
   session[:birthday] = user_params[:birthday]
       # バリデーション用に、仮でインスタンスを作成する
   @user = User.new(
     nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
     email: session[:email],
     password: session[:password],
     last_name: session[:last_name], # 入力前の情報は、バリデーションに通る値を仮で入れる
     first_name: session[:first_name], 
     last_name_kana: session[:last_name_kana], 
     first_name_kana: session[:first_name_kana], 
     birthday: session[:birthday],
     phone_number: '090XXXXXXXX'
   )
   render '/signup/step2' unless @user.valid?
  end

  def validates_step3
    session[:phone_number] = user_params[:phone_number]
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name], # 入力前の情報は、バリデーションに通る値を仮で入れる
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana], 
      birthday: session[:birthday],
      phone_number: session[:phone_number]
     )
     render '/signup/step3' unless @user.valid?
  end

  def validates_step4
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
      email: session[:email], # sessionに保存された値をインスタンスに渡す
      password: session[:password],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday: session[:birthday],
      phone_number: session[:phone_number]
    )
    @address = Address.new(
      post_number: session[:post_number],
      prefecture_id: session[:prefecture_id],
      city: session[:city],
      town: session[:town],
      building: session[:building]
    )
    render '/signup/step4' unless @user.valid?
    render '/signup/step4' unless @address.valid?
  end

  def create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email], # sessionに保存された値をインスタンスに渡す
      password: session[:password],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday: session[:birthday],
      phone_number: session[:phone_number]
    )
    @address = Address.new(
      post_number: session[:post_number],
      prefecture_id: session[:prefecture_id],
      city: session[:city],
      town: session[:town],
      building: session[:building]
    )

    if @user.save
      session[:user_id] = @user.id
      @address[:user_id] = @user.id
      @address.save
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

    def birthday_join(params)
      date = params
      if date["birthday(1i)"].empty? && date["birthday(2i)"].empty? && date["birthday(3i)"].empty?
        return
      end

      params[:birthday] = Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i
    end

end
