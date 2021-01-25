class Information < ApplicationRecord
  has_many :comments
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  belongs_to :user
  has_many :ranks
  is_impressionable counter_chache: true
  has_many :information_tags, dependent: :destroy
  has_many :tags, through: :information_tags
  mount_uploader :image, ImageUploader
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :tag

  def self.search(search)
    if search != ""
      Information.where(['title LIKE ?', "%#{search}%"])
    else
      Information.all
    end
  end

end
