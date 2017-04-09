class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :name, format: {with: /[a-zA-Z]+/}

  validates :vin, presence: true
  validates :vin, format: {with: /[1-9a-zA-Z]+/}

  def total_amount
    total = 0
    self.trips.each do |trip|
      total += trip.cost
    end
    return (total - total * 0.15).round(2)
  end

  def average_rating
    rating = 0.0
    self.trips.each do |trip|
      if trip.rating == nil
        next
      end
      rating += trip.rating
    end
    if rating != 0
      return (rating/self.trips.length).round(2)
    else
      return "0"
    end
  end
end
