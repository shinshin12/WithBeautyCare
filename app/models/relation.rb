class Relation < ApplicationRecord
  belongs_to :user
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  belongs_to :rank
  mount_uploader :image, ImageUploader
end
