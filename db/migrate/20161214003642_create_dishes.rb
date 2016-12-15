class CreateDishes < ActiveRecord::Migration[5.0]
  def change
    create_table :dishes do |t|
      t.integer :restaurant_id
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
