class Offer < ApplicationRecord
  belongs_to :user
  has_one :reservation
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :location, presence: true
  validates :summary, presence: true, length: { minimum: 32, maximum: 4096 }
  has_many_attached :photos
end
