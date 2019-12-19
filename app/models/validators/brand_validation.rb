
class BrandValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ 
      record.errors[attribute] << (options[:message] || "はメールアドレスではありません")
    end
  end
end
 
class Item < ApplicationRecord
  validates :email, presence: true, email: true
end



