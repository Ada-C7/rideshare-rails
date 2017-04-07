class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :name, format: {with: /[a-zA-Z]+/}

  validates :vin, presence: true
  validates :vin, format: {with: /[1-9a-zA-Z]+/}
  #
  # validates :driver_id, presence: true
  # validates :driver_id, numericality: {greater_than: 0}
  #
  def total_amount
    total = 0
    self.trips.each do |trip|
      total += trip.cost
    end
    return total.round(2)
  end

  def average_rating
    rating = 0.0
    self.trips.each do |trip|
      if trip.rating == nil
        next
      end
      rating += trip.rating
    end
    return (rating/self.trips.length).round(2)
  end
end
