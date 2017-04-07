class Passenger < ApplicationRecord
  validates :passenger_id, presence: true, numericality: { only_integer: true }
  validates :name, presence: true

  has_many :trips

  def total_cost

    trips_array = trips

    cost_array = []

    trips_array.each do |trip|
      cost_array << trip.cost
    end

    cost = cost_array.sum

  end

  def can_make_new_trip
    trips.each do |trip|
      rating = trip.rating
      if rating == nil
        return false
      end
    end
    return true
  end

end
