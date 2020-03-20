class Jet < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :bookings
  validates :model, presence: true, length: { minimum: 3 }
  validates :capacity, presence: true, numericality: true
  validates :unit_price, presence: true, numericality: true
  validates :speed, presence: true, numericality: true
  validates :range, presence: true, numericality: true
  validates :flight_time, presence: true, numericality: true
  validates :size, inclusion: { in: ["Small Prop", "Small Jet", "Medium Jet", "Regional Airliner"]}
  has_many_attached :photos

  include PgSearch::Model
  pg_search_scope :search_by_name_and_model,
    against: [ :model ],
    associated_against: {
      city: [ :name ]
    },
    using: {
      tsearch: { prefix: true, any_word: true }
    }

  def read_format(number)
    first = number/1000.to_i
    last = number%1000

    # Avoid errors from numbers like xx00x or xx0xx
    if last < 10
      last = '00' + last.to_s
    elsif last < 100
      last = '0' + last.to_s
    end

    return "#{first}.#{last}"
  end
end
