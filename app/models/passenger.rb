class Passenger < ApplicationRecord
  validates :passenger_id, presence: true, numericality: { only_integer: true }
  validates :name, presence: true

  has_many :trips

end
