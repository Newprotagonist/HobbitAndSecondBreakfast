class Offer < ApplicationRecord
  belongs_to :user
  has_one :reservation
end
