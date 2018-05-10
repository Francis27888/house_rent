class HousePicture < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :house
end
