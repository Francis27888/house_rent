class House < ApplicationRecord
    belongs_to :user
    has_many :house_pictures, dependent: :destroy
end
