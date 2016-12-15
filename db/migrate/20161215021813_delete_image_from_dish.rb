class DeleteImageFromDish < ActiveRecord::Migration[5.0]
  def change
    remove_column :dishes, :image
  end
end
