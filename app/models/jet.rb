class Jet < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :bookings
  validates :name, presence: true, length: { minimum: 3 }
  validates :capacity, presence: true, numericality: true
  validates :unit_price, presence: true, numericality: true
  has_many_attached :photos
  has_many :jet_reviews, through: :bookings, source: :reviews

  include PgSearch::Model
  pg_search_scope :search_by_name_and_model,
    against: [ :model ],
    associated_against: {
      city: [ :name ]
    },
    using: {
      tsearch: { prefix: true, any_word: true }
    }
end
