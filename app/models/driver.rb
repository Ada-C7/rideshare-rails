class Driver < ApplicationRecord
  has_many :trips
  has_many :passengers
  validates :name, presence: true, uniqueness: true
  validates :vin, presence: true, uniqueness: true

  def average_rating
    driver_ratings = trips.map { |trip| trip.rating.to_f  }
    average = driver_ratings.inject(:+) / driver_ratings.length

    average
  end
end
