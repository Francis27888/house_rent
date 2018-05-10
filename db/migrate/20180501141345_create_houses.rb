class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :location
      t.integer :number_of_rooms
      t.string :booked_status

      t.timestamps
    end
  end
end
