class Driver < ApplicationRecord
  has_many :trips
  validates :vin, presence: true, uniqueness: true, length: {is: 17, message: " must be 17 characters" }
  validates :name, presence: true

  def total_amount_earned
    total_amount_earned = 0
    self.trips.each do |trip|
      total_amount_earned += trip.price
    end
    total_amount_earned -= (total_amount_earned*0.15)
  end

  def rating
    added_ratings = 0
    self.trips.each do |trip|
      if trip.rating == nil
        return nil
      else
        added_ratings += trip.rating
      end
    end
    added_ratings / self.trips.length
  end

  def all_trips_complete?
    self.trips.each do |trip|
      if trip.rating == nil
        return false
      end
    end
    return true
  end

  def self.first_available
    self.all.shuffle.each do |driver|
      if driver.all_trips_complete?
        return driver
      end
    end
  end

end
