class Driver < ApplicationRecord
  has_many :trips
  has_many :passengers
  validates :name, presence: true, uniqueness: true
  validates :vin, presence: true, uniqueness: true, numericality: { only_integer: true, greater_than: 0 }

  def average_rating
    driver_ratings = trips.map { |trip| trip.rating.to_f  }
    avgerage = driver_ratings.inject(:+) / driver_ratings.length

    avgerage
  end
end
