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
  validate :brand_present, on: :update_brand
  belongs_to :user, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  belongs_to :category
  belongs_to :brand, optional: true
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: :reject_images
  validates :images, length: { minimum: 1, message: "画像がありません"}
  has_one :prefecture
  

  enum condition: {

    新品、未使用:1,未使用に近い:2,目立った傷や汚れなし:3,
    やや傷や汚れあり:4,傷や汚れあり:5,全体的に状態が悪い:6
  }

  enum days: {

    １〜２日で発送:1,
    ２〜３日で発送:2,
    ４〜７日で発送:3,
  }

  enum delivery_fee: {

    送料込み（出品者負担）:1,
    着払い（購入者負担）:2,
  }

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

  }

  enum status: {
    出品中:1,
    取引中:2,
    売却済み:3,
    購入済み:4,
  }

  def self.buyable(id)
    if id == nil
      where.not(status: 4)
    else
      where.not(user_id: id, status: 4)
    end
  end

  scope :recent10, -> { order(created_at: :desc).limit(10)}
  scope :recent, -> { order(created_at: :desc)}
  scope :get_category_items, -> (category_id) {where(category_id: category_id)}

  def reject_images(attributes)
    attributes['image'].blank?
  end


  def set_fee_profit
    self.fee = self.price * 0.1
    self.profit = self.price * 0.9
  end


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


  def update_brand(id)
    self.update(brand_id: id)
  end

  

end
