class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :gps
      t.integer :user_id
      t.string :image

      t.timestamps
    end
  end
end
