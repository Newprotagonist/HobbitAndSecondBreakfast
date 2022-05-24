class Offer < ApplicationRecord
  belongs_to :user
  has_one :reservation
  validates :price, presence: true, numericality: { other_than: 0 }
  validates :localisation, presence: true
  validates :summary, presence: true, length: { minimum: 32, maximum: 256 }
  has_many_attached :photos
end
