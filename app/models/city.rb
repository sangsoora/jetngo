class City < ApplicationRecord
  has_many :jets
  validates :name, uniqueness: true, presence: true, length: { minimum: 2 }
end
