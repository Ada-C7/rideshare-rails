class Driver < ApplicationRecord
  has_many :trips
  validates :name, presence: true, uniqueness: true
  validates :driver_id, length: { minimum: 1 }, uniqueness: true, numericality: { only_integer: true }
  validates :vin, length: { is: 17 }
end
