class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  validates :end_date, presence: true, date: { after_or_equal_to: :start_date }
  validates :start_date, presence: true
end
