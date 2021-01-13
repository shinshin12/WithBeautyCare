class Tag < ActiveHash::Base
 self.data = [
  {id: 1, name: "--"},
  {id: 2, name:"食事"}
  {id: 3, name:"スキンケア"}
  {id: 4, name:"病院"}
  {id: 5, name:"ステロイド"}
  {id: 6, name:"その他"}
 ]

 include ActiveHash::Associations
 has_many :informations
end