class Offer < ApplicationRecord
  belongs_to :user
  has_one :reservation
  has_many_attached :photos
end
