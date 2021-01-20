class Rank < ApplicationRecord
  belongs_to :information
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :follower, class_name: "Relation", foreign_key: "follower_id"
  has_many :followed, class_name: "Relation", foreign_key: "followed_id"
  has_many :following_user, through: :follower, source: :followed 
  has_many :follower_user, through: :followed, source: :follower
  is_impressionable counter_chache: true
end
