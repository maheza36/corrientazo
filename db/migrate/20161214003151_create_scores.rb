class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.integer :restaurant_id
      t.integer :user_id
      t.integer :score
      t.string :remark

      t.timestamps
    end
  end
end
