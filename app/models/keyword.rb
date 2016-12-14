class Keyword < ApplicationRecord
  has_many :kewword_dishes, class_name: "KewwordDish"
end
