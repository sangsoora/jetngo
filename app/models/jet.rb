class Jet < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :bookings
  validates :name, presence: true, length: { minimum: 3 }
  validates :capacity, presence: true, numericality: true
  validates :unit_price, presence: true, numericality: true
end
