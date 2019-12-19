class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    # step2入力項目
    validates :nickname,                presence: {message: "ニックネームを入力してください"}, length: {maximum: 20}, unless: :uid?
    validates :email,                   presence: {message: "メールアドレスを入力してください"}, uniqueness: {on: :create}, format: { with: VALID_EMAIL_REGEX }
    validates :password,                presence: {message: "パスワードを入力してください"},length: {minimum: 6, maximum: 10}
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

    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
    end

  has_many :authorizations
  has_one :address, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :bouht_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "user_id", class_name: "Item"
  has_one :cards,dependent: :destroy
end
