class Trip < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver

  validates :trip_id, length: { minimum: 1 }, uniqueness: true, numericality: { only_integer: true }
  validates :driver_id, length: { minimum: 1 }, uniqueness: true, numericality: { only_integer: true }
  validates :passenger_id, length: { minimum: 1 }, uniqueness: true, numericality: { only_integer: true }
  validates :date, presence: true
  validates_inclusion_of :rating, :in => 1..5
end
