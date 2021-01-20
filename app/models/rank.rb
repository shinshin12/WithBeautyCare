class Rank < ApplicationRecord
  belongs_to :information
  belongs_to :user
  has_many :relations
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  is_impressionable counter_chache: true

end
