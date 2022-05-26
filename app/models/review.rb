class Review < ApplicationRecord
  belongs_to :giver, class_name: "User"
  belongs_to :receiver, class_name: "User"
  belongs_to :reservation

  validates :content, presence: true, length: { minimum: 10, maximum: 2048 }
  validates :rating, presence: true, numericality: { in: 0..5 }
end
