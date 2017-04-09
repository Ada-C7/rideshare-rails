class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :vin, presence:true, uniqueness: true

  def self.available_driver
    drivers = Driver.where(available: true)
    driver = drivers.sample
    return driver
  end

  def total_cost
    total_cost = 0
    driver_trips = self.trips
    driver_trips.each do |trip|
      total_cost += trip.cost
    end
    return "$ #{(total_cost / 100.0).round(2)}"
  end

  def average_rating
    total = 0.0
    driver_trips = self.trips
    trip_count = driver_trips.length
    driver_trips.each do |trip|
      total += trip.rating
      if trip.rating == 0
        trip_count -= 1
      end
    end
    return "#{(total / trip_count).round(2)}"
  end

end
