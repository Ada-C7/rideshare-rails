class Trip < ApplicationRecord
  # belongs_to :driver, :passenger
  validates :rating, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 6 }
  validates :driver_id, presence: true
  validates :passenger_id, presence: true
  validates :date, presence: true
  validates :cost, presence: true 
end
