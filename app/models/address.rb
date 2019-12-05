class Address < ApplicationRecord

    validates :post_number,                presence: true
    validates :prefecture_id,              presence: true
    validates :city,                       presence: true
    validates :town,                       presence: true

  belongs_to :user, optional: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

end
