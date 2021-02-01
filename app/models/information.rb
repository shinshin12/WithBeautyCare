class Information < ApplicationRecord
  has_many :comments
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  belongs_to :user
  has_many :ranks
  is_impressionable counter_chache: true
  mount_uploader :image, ImageUploader
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
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
