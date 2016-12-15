class Keyword < ApplicationRecord
  has_many :kewworddishes, class_name: "KewwordDish"
end
