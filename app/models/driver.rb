class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :name, uniqueness: true

  validates :vin, presence: true
  validates :vin, uniqueness: true

  def available?(driver)
    trips = driver.trips
    trips.each do |trip|
      if trip.rating == 0
        return false
      end
    end
  end

  def self.assign_driver
    drivers = Driver.all
    driver = drivers.sample
    if driver.available?(driver)
      return driver.id
    else
      assign_driver
    end
  end

  def total_earned
    total = 0
    trips = self.trips
    trips.each do |trip|
      total += trip.cost
    end
    return total
  end

end
