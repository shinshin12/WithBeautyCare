class Rank < ApplicationRecord
  belongs_to :information
  belongs_to :user
  has_many :likes
  is_impressionable counter_chache: true
end
