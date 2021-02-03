class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
        
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :like_informations, through: :likes, source: :information
  has_many :informations
  has_many :ranks
  has_many :relations
  has_many :follower, class_name: "Relation", foreign_key: "follower_id", dependent: :destroy 
  has_many :followed, class_name: "Relation", foreign_key: "followed_id", dependent: :destroy
  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower
  mount_uploader :image, ImageUploader

  validates :nickname, presence:  { message: 'ニックネームを入力してください' }
  validates :password, presence:  { message: 'パスワードを入力してください' }
  validates :email, presence:  { message: 'メールアドレスを入力してください' }

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角英字と半角数字の両方を含めて設定してください' 
  



  

  def already_liked?(information)
    self.likes.exists?(information_id: information.id)
  end

  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end
  
  def following?(user)
    following_user.include?(user)
  end

end
