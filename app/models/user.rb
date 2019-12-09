class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    # step2入力項目
    validates :nickname,                presence: {message: "ニックネームを入力してください"}, length: {maximum: 20}
    validates :email,                   presence: {message: "メールアドレスを入力してください"}, uniqueness: true, format: { with: VALID_EMAIL_REGEX }, on: :validates_step2
    validates :password,                presence: {message: "パスワードを入力してください"}, length: {minimum: 6, maximum: 128}, on: :validates_step2
    validates :last_name,               presence: {message: "姓を入力してください"}
    validates :first_name,              presence: {message: "名を入力してください"}
    validates :last_name_kana,          presence: {message: "姓カナを入力してください"}
    validates :first_name_kana,         presence: {message: "名カナを入力してください"}
    validates :birthday,                presence: {message: "生年月日を入力してください"}
    validates :agreement,               acceptance: true, numericality: {greater_than: 0, message: "選択してください" }
    # validates_acceptance_of :agreement, numericality: {greater_than: 0, message: "選択してください" }
    # validates :prefecture_id, numericality: {greater_than: 0, message: "選択してください" }

        # step3入力項目
    validates :phone_number,            presence: {message: "会員登録できません"}, length: {minimum: 10, maximum: 11}



  has_one :address
  accepts_nested_attributes_for :address
  has_many :items, dependent: :destroy
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "user_id", class_name: "Item"
  has_one :address, dependent: :destroy
  has_one :cards,dependent: :destroy
end
