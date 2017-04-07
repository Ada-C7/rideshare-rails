class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :name, uniqueness:true

  validates :vin, presence: true

  def average_rating
    total_ratings = self.trips.map {|trip| trip.rating}.reduce(:+).to_f
    return (total_ratings/self.trips.count).round(1)
  end

  def total_earnings
    self.trips.map {|trip| trip.fare}.reduce(:+).round(2)
  end
end
