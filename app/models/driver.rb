class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :vin, presence:true, uniqueness: true


  def self.available_driver
    drivers = Driver.where(available: true)
    driver = drivers.first #########TESTING
    return driver
  end

  def make_unavailable
    self.available = false
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
    driver_trips.each do |trip|
      total += trip.rating
    end
    return "#{total / (self.trips.length)}"
  end

end
