class Information < ApplicationRecord
  belongs_to :user
  has_many :comments
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
