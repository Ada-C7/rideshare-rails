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
    return total.round(2)
  end

  def average_rating
    average = 0
    total = 0
    trips = self.trips
    trips.each do |trip|
      total += trip.rating
    end
    if total == 0
      average = "No trips rated yet"
    else
      average = "#{(total/trips.length)}/5"
    end

  end

  def next
    Driver.where("id > ?", self.id).first
  end

  def prev
    Driver.where("id < ?", self.id).last
  end

end
