class Item < ApplicationRecord
  belongs_to :users
  belongs_to :category
  has_many :item_images
end
