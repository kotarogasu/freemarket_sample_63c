class Brand < ApplicationRecord
  has_many :brands_categories
  has_many :categories, through: :brands_categories



  private

  def self.search(brand_name)
    return nil if brand_name == ""
    @brand = Brand.find_by(name: brand_name)
  end
end
