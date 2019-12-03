class Item < ApplicationRecord
  validates :name, presence: true, length: {maximum: 40}
  validates :item_text, presence: true
  validates :condition, presence: {message: "選択してください"}
  validates :category_id, numericality: {greater_than: 0, message: "選択してください" }
  validates :delivery_method, presence: {message: "選択してください"}
  validates :delivery_fee, presence: {message: "選択してください"}
  validates :days, presence: {message: "選択してください"}
  validates :prefecture_id, numericality: {greater_than: 0, message: "選択してください" }
  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_qual_to: 9999999, message: "300以上9999999以下で入力してください" }
  belongs_to :user
  belongs_to :category
  belongs_to :brand
  has_many :images
  


  enum condition: {

    新品、未使用:1,未使用に近い:2,目立った傷や汚れなし:3,
    やや傷や汚れあり:4,傷や汚れあり:5,全体的に状態が悪い:6
  }, _suffix: true

  enum days: {

    １〜２日で発送:1,
    ２〜３日で発送:2,
    ４〜７日で発送:3,
  }, _suffix: true

  enum delivery_fee: {

    送料込み（出品者負担）:1,
    着払い（購入者負担）:2,
  }, _suffix: true

  enum delivery_method: {

    未定:1,
    らくらくメルカリ便:2,
    ゆうメール:3,
    レターパック:4,
    普通郵便（定形、定形外:5,
    クロネコヤマト:6,
    ゆうパック:7,
    クリックポスト:8,
    ゆうパケット:9

  }, _suffix: true

  enum status: {

    出品中:1,
    取引中:2,
    売り切れ:3,
  }


  scope :get_category_items, -> (category_id) {where(category_id: category_id)}



  def self.range(categories)
    start_id = categories.first.id
    last_id = categories.last.id
    Range.new(start_id, last_id)
  end

  def self.get_ladies
    children = Category.find_by(name: "レディース").children
    ladies_items = get_category_items(range(children))
  end
  
  def self.get_mens
    children = Category.find_by(name: "メンズ").children
    mens_items = get_category_items(range(children))
  end

  def self.get_electronics
    children = Category.find_by(name: "家電・スマホ・カメラ").children
    electronics_items = get_category_items(range(children))
  end

  def self.get_hobbies
    children = Category.find_by(name: "おもちゃ・ホビー・グッズ").children
    hobbies_items = get_category_items(range(children))
  end
  

end
