class CreateKewwordDishes < ActiveRecord::Migration[5.0]
  def change
    create_table :kewword_dishes do |t|
      t.integer :keyword_id
      t.integer :dish_id

      t.timestamps
    end
  end
end
