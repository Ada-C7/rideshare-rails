class Trip < ApplicationRecord
  belongs_to :driver

  belongs_to :passenger

  validates :id, presence: true, uniqueness: true
  validates :driver_id, presence: true
  validates :passenger_id, presence: true
  validates :date, presence: true
  validates :rating, presence: true, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 5
  # inclusion: { in: (1..5) }
end
