class Information < ApplicationRecord
  belongs_to :user
  has_many :comments
  mount_uploader :image, ImageUploader
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :tag


  def self.search(search)
    if search != ""
      Information.where('text LIKE(?)', "%#{search}%")
    else
      Information.all
    end
  end
end
