class Driver < ApplicationRecord
  validates :driver_id, presence: true, numericality: { only_integer: true }
  validates :vin, presence: true, length: {is: 17}

  has_many :trips
end
