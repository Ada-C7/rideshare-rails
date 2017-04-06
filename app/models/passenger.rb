class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true

  validates :phone, presence: true
  validates :phone, uniqueness: true

  def all_trips_rated?
    all_trips = self.trips.all
    all_trips.each do |trip|
      if trip.rating == 0
        return false
      end
    end
  end
  
end
