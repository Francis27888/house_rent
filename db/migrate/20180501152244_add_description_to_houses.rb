class AddDescriptionToHouses < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :description, :text
  end
end
