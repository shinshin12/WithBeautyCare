class Rank < ApplicationRecord
  belongs_to :information
  belongs_to :user
  is_impressionable counter_chache: true
end
