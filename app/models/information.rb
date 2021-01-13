class Information < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :tag
end
