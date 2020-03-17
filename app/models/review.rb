class Review < ApplicationRecord
  belongs_to :booking
  validates :content, presence: true, length: { minimum: 5 }
  validates :rating, presence: true, numericality: true, inclusion: { in: [0, 1, 2, 3, 4, 5] }
end
