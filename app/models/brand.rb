class Brand < ApplicationRecord
  has_many :brands_categories
  has_many :categories, through: :brands_categories
  has_many :items



  private

  def self.search(brand_name)
    return nil if brand_name == ""
    brand = Brand.find_by(name: brand_name)
  end

  def self.buyable_items(name, id)
    return nil if name == ""
    brand = Brand.find_by(name: name)
    buyable_items = brand.items.buyable(id)
  end


end
