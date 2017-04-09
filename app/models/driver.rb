class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true

  validates :vin, presence: true,
                  length: { is: 17 }, allow_blank: false

  def self.active_drivers
    @active_drivers if defined? @active_drivers
    @active_drivers = Array.new
    Driver.all.each do |driver|
      if driver.active
        @active_drivers << driver
      end
    end
    return @active_drivers
    
  end

  def average_rating
    trip_count = 0
    total_rating = 0.0
    trips.each do |trip|
      trip_count += 1
      if trip.rating != nil
        total_rating += trip.rating
        return (total_rating/trip_count).round(2)
      else
        return total_rating
      end
    end
  end

  def total_earnings
    gross_earnings = 0
    trips.each do |trip|
      gross_earnings += trip.cost
    end
    return (gross_earnings/100 * 0.85).round(2)

  end

  def self.qual_driver
    return @qual_drivers.sample(1) if defined? @qual_drivers

    @qual_drivers = Array.new
    Trip.all.each do |trip|
      if trip.driver.average_rating >= 4
        @qual_drivers << trip.driver
      end
    end
    return @qual_drivers.sample(1)
  end
end
