class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true, uniqueness: true
  validates :passenger_id, length: { minimum: 1 }, uniqueness: true, numericality: { only_integer: true }
  validates :phone_num, presence: true
end
