class Trip < ApplicationRecord
  validates :rating, numericality: { only_integer: true, less_than_or_equal_to: 5, greater_than_or_equal_to: 1 }, allow_nil: true
  validates :driver_id, presence: true
  validates :passenger_id, presence: true

  belongs_to :passenger
  belongs_to :driver
end
