class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :phone_number, presence: true, length: {minimum:7}

  def spent
    trips.empty? ? 0 : trips.map {|trip| trip.cost}.reduce(:+)
  end

  def rated_all_trips?
    !trips.any? { |trip| trip.rating.nil? }
  end
end
