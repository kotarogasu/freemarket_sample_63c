class Image < ApplicationRecord
  mount_uploader :src, SrcUploader
  belongs_to :item, optional: true
end
