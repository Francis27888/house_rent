class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   validates :names,  presence: true, length: { maximum: 30 }
   validates :phone_number,  presence: true, length: { maximum: 10 }
   validates :user_category,  presence: true
   has_many :houses, dependent: :destroy
end
