class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    # step2入力項目
    validates :nickname,                presence: true, length: {maximum: 20}
    validates :email,                   presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }, on: :validates_step2
    validates :password,                presence: true, length: {minimum: 6, maximum: 128}, on: :validates_step2
    validates :last_name,               presence: true
    validates :first_name,              presence: true
    validates :last_name_kana,          presence: true
    validates :first_name_kana,         presence: true
    validates :birthday,                presence: true
    # step3入力項目
    validates :phone_number,            presence: true, length: {minimum: 10, maximum: 11}
    
  has_one :address
  accepts_nested_attributes_for :address
  has_many :items, dependent: :destroy
  has_one :address, dependent: :destroy
  has_one :cards,dependent: :destroy
end
