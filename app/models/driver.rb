class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :vin, presence: true, uniqueness: true, length: { is: 17 }

  def find_avg_rating
    @trips = Trip.where(driver_id: @id) # returns an array of hashes
    return @avg_rating = "%.2f" % (@trips.sum { | trip | trip.rating }/@trips.length.to_f)
  end
end
