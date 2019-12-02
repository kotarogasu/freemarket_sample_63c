class Brand < ApplicationRecord
  has_many :brands_categories
  has_many :categories, through: :brands_categories
end
