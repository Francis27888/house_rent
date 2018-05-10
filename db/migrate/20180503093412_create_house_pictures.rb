class CreateHousePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :house_pictures do |t|
      t.text :image

      t.timestamps
    end
  end
end
