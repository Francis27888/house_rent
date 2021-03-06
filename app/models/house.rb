# frozen_string_literal: true
# House

class House < ApplicationRecord
  belongs_to :user
  has_many :house_pictures, dependent: :destroy
  validates :description, presence: true, length: { minimum: 200 }
  validates :location, presence: true
  validates :number_of_rooms, presence: true, format: {
    with: /\A\d+\z/, message: 'only numbers allowed'
  }
  include PgSearch
  pg_search_scope :search, against: [:location],
                           using: {
                             tsearch: {
                               dictionary: 'english'
                              }
                            }

  def self.text_search(query)
    if query.present?
      where('location @@ :q', q: query)
    else
      all
    end
  end

end
