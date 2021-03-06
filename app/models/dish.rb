class Dish < ApplicationRecord
  belongs_to :restaurant, class_name: "Restaurant", foreign_key: "restaurant_id"
  has_many :kewworddishes, class_name: "KewwordDish"

  mount_uploader :avatar, AvatarUploader

end
