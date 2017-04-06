class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true

  validates :vin, presence: true,
                  length: { is: 17 }, allow_blank: false

  def average_rating id
    driver = Driver.find id
    trip_count = 0
    total_rating = 0.0
    driver.trips.each do |trip|
      trip_count += 1
      total_rating += trip.rating
    end
    return (total_rating/trip_count).round(2)
  end

  def total_earnings id
    driver = Driver.find id
    gross_earnings = 0
    driver.trips.each do |trip|
      gross_earnings += trip.cost
    end
    return (gross_earnings/100 * 0.85).round(2)

  end


end
