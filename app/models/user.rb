class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  has_many :informations
  has_many :comments
  mount_uploader :image, ImageUploader
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture


  def User.search(search, user_or_information)
    if user_or_post == "1"
       User.where(['nickname LIKE ?', "%#{search}%"])
    else
       User.all
    end
end

end
