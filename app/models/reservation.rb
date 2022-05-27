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

  def done?
    status == "Done"
  end

  def over?
    end_date <= Date.today
  end

  def started?
    start_date <= Date.today
  end

  private

  def end_date_is_after_start_date
    if end_date.blank?
      errors.add(:end_date, "cannot be blank")
    end
    if start_date.blank?
      errors.add(:start_date, "cannot be blank")
    end

    if end_date < start_date
      errors.add(:end_date, "cannot be before the start date")
    end
  end
end
