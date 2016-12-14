class KewwordDish < ApplicationRecord
  belongs_to :dish, class_name: "Dish", foreign_key: "dish_id"
  belongs_to :keyword, class_name: "Keyword", foreign_key: "keyword_id"
end
