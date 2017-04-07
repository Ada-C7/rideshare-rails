class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true

  validates :vin, presence: true,
                  length: { is: 17 }, allow_blank: false

  def average_rating
    trip_count = 0
    total_rating = 0.0
    trips.each do |trip|
      trip_count += 1
      total_rating += trip.rating
    end
    return (total_rating/trip_count).round(2)
  end

  def total_earnings
    gross_earnings = 0
    trips.each do |trip|
      gross_earnings += trip.cost
    end
    return (gross_earnings/100 * 0.85).round(2)

  end

  def self.qual_driver
    qual_drivers = []
    Trip.all.each do |trip|
      if trip.driver.average_rating >= 4
        qual_drivers << trip.driver
      end
    end
    return qual_drivers.sample(1)
  end

end
