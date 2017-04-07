class Passenger < ApplicationRecord
  has_many :trips

  def spent
    trips.map {|trip| trip.cost}.reduce(:+)
  end

  def rated_all_trips?
    !trips.any? { |trip| trip.rating.nil? }
  end
end
