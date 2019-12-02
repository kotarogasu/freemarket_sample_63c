class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :images
  


  enum condition: {
    "---":0,
    新品、未使用:1,未使用に近い:2,目立った傷や汚れなし:3,
    やや傷や汚れあり:4,傷や汚れあり:5,全体的に状態が悪い:6
  }, _suffix: true

  enum days: {
    "---":0,
    １〜２日で発送:1,
    ２〜３日で発送:2,
    ４〜７日で発送:3,
  }, _suffix: true

  enum delivery_fee: {
    "---":0,
    送料込み（出品者負担）:1,
    着払い（購入者負担）:2,
  }, _suffix: true


end
