class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :name, uniqueness:true

  validates :vin, presence: true

  def ratings
    self.trips.map { |trip| trip.rating }.compact
  end

  def average_rating
    if self.ratings.empty?
      "n/a"
    else
      total_ratings = self.ratings.reduce(:+).to_f
      return (total_ratings/self.trips.count).round(1)
    end
  end

  def total_earnings
    if self.trips.empty?
      "n/a"
    else
      self.trips.map { |trip| trip.fare }.reduce(:+).round(2)
    end
  end
end
