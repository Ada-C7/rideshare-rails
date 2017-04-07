class Passenger < ApplicationRecord
  has_many :trips

  def spent
    trips.map {|trip| trip.cost}.reduce(:+)
  end
end
