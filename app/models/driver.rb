class Driver < ApplicationRecord
  has_many :trips #this gives our driver a trips method that returns a collection of all the trips

  validates :name, presence: true
  validates :vin, presence: true, uniqueness: true, length: { is: 17 }




  def find_avg_rating
    trips = self.trips
    total = 0

    trips.each do | trip |
      # @avg_rating = "%.2f" % (@trips.sum { | trip | trip.rating }/@trips.length.to_f)
      total += trip.rating.to_f
    end
    return total / trips.length
  end
end
