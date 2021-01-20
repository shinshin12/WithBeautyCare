class Relation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  belongs_to :rank, optional: true
  mount_uploader :image, ImageUploader
end
