# frozen_string_literal: true
# HousePicture

class HousePicture < ApplicationRecord
  belongs_to :house
  mount_uploader :image, ImageUploader
end