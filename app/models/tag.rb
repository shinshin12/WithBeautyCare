class Tag < ApplicationRecord
  has_many :information_tags, dependent: :destroy
  has_many :informations, through: :information_tags
end



