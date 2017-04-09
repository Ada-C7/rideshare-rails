class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :phone_number, presence: true, length: {minimum:7}

  def rated_all_trips?
    !trips.any? { |trip| trip.rating.nil? }
  end
end
