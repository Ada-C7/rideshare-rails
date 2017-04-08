class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :name, uniqueness:true

  validates :vin, presence: true

  def ratings
    # returns array of all trip ratings, excluding nil
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
      0
    else
      gross_earnings = self.trips.map { |trip| trip.fare }.reduce(:+)
      (gross_earnings * 0.85).round(2)
    end
  end
end
