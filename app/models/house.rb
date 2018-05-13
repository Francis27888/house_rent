class House < ApplicationRecord
    belongs_to :user
    has_many :house_pictures, dependent: :destroy
    validates :description,  presence: true, length: { minimum: 200 }
    validates :location,  presence: true
    validates :number_of_rooms,  presence: true,format: { with: /\A\d+\z/, message: "only numbers allowed" }
end
