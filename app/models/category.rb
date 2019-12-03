class Category < ApplicationRecord
  has_many :items
  has_many :brands_categories
  has_many :brands, through: :brands_categories
  has_ancestry
end
