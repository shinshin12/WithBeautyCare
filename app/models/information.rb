class Information < ApplicationRecord
  has_many :comments
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  belongs_to :user
  has_many :ranks
  is_impressionable counter_chache: true
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

end
