class Information < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user
  mount_uploader :image, ImageUploader
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :tag

  def Information.search(search, user_or_information)
    if user_or_post == "2"
       Information.where(['title LIKE ?', "%#{search}%"])
    else
       Information.all
    end
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
