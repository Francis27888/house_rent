class AddHouseIdToHousePictures < ActiveRecord::Migration[5.2]
  def change
    add_reference :house_pictures, :house, foreign_key: true
  end
end
