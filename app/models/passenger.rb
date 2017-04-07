class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :phone_num, presence: true, uniqueness: true

  def trips_cost
    trips = self.trips
    total = 0

    if trips.length == 0
      return 0
    end

    trips.each do | trip |
      total += trip.cost
    end

    return total
  end
end
