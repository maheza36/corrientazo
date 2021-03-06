class Restaurant < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  has_many :scores, class_name: "Score"
  has_many :dishes, class_name: "Dish"
end
