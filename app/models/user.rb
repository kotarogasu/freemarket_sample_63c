class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    # step2入力項目
    validates :nickname,                presence: {message: "ニックネームを入力してください"}, length: {maximum: 20}, unless: :uid?
    validates :email,                   presence: {message: "メールアドレスを入力してください"}, uniqueness: true, format: { with: VALID_EMAIL_REGEX }, on: :validates_step2, unless: :uid?
    validates :password,                presence: {message: "パスワードを入力してください"}, length: {minimum: 6, maximum: 128}, on: :validates_step2, unless: :uid?
    validates :last_name,               presence: {message: "姓を入力してください"}, unless: :uid?
    validates :first_name,              presence: {message: "名を入力してください"}, unless: :uid?
    validates :last_name_kana,          presence: {message: "姓カナを入力してください"}, unless: :uid?
    validates :first_name_kana,         presence: {message: "名カナを入力してください"}, unless: :uid?
    validates :birthday,                presence: {message: "生年月日を入力してください"}, unless: :uid?
    validates :agreement,               acceptance: true, numericality: {greater_than: 0, message: "選択してください" }, unless: :uid?
    # validates_acceptance_of :agreement, numericality: {greater_than: 0, message: "選択してください" }
    # validates :prefecture_id, numericality: {greater_than: 0, message: "選択してください" }

        # step3入力項目
    validates :phone_number,            presence: {message: "会員登録できません"}, length: {minimum: 10, maximum: 11}

    def self.from_omniauth(access_token)
        binding.pry
        data = access_token.info
        user = User.where(email: data['email']).first
        # binding.pry
        # Uncomment the section below if you want users to be created if they don't exist
        # unless user
        #     user = User.create(
        #       nickname: data['name'],
        #       email: data['email'],
        #       password: Devise.friendly_token[0,20],
        #       first_name: data['first_name'],
        #       last_name: data['last_name'],
        #       birthday: data['birthday'],
        #       phone_number: data['phone_number']
        #     )
        #     binding.pry
        # end
        user
    end

  has_many :authorizations
  has_one :address
  accepts_nested_attributes_for :address
  has_many :items, dependent: :destroy
  has_one :address, dependent: :destroy
end
