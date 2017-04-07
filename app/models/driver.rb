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
    return nil if self.trips.empty?
    added_ratings = 0
    self.trips.each do |trip|
      added_ratings += trip.rating
    end
    added_ratings / self.trips.length
  end
end
