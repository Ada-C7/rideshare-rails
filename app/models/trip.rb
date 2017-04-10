class Trip < ApplicationRecord
  belongs_to :rider
  belongs_to :driver

  # will need to add error messages in views, and possibly more validations

  validates :driver_id, presence: true, numericality: { only_integer: true }
  validates :rider_id, presence: true, numericality: { only_integer: true }
  validates :date, presence: true
  validates :rating, numericality: { only_integer: true, greater_than: 0, less_than: 6 }, allow_nil: true

  def rand_driver
    rand_driver = Driver.where(availability: true)
    rand_driver.sample
  end

  def today_date
    date = Date.today
    return date
  end
end
