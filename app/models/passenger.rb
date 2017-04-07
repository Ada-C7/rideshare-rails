class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :phone_num, presence:true

  def has_incomplete_rating
    passenger_trips = self.trips
    passenger_trips.each do |trip|
      if trip.rating == 0
        return true
      end
    end

    return false
  end

  def total_cost
    total_cost = 0
    passenger_trips = self.trips
    passenger_trips.each do |trip|
      total_cost += trip.cost
    end
    return (total_cost / 100.0).round(2)
  end

end
