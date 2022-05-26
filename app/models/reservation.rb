class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  has_many :reviews
  validates :title, presence: true, length: { minimum: 4, maximum: 120 }
  validates :end_date, :start_date, presence: true
  validate :end_date_is_after_start_date

  def accepted?
    status == "Accepted"
  end

  def over?
    end_date <= Date.today
  end

  private

  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?

    return unless end_date < start_date

    errors.add(:end_date, "cannot be before the start date")
  end
end
