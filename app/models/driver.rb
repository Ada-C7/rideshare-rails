class Driver < ApplicationRecord
  has_many :trips #this gives our driver a trips method that returns a collection of all the trips

  validates :name, presence: true
  validates :vin, presence: true, uniqueness: true, length: { is: 17 }


  def find_avg_rating

    trips = self.trips
    total = 0

    if trips.length == 0
      return 0
    end

    trips.each do | trip |
      total += trip.rating.to_f
    end

    return total / trips.length
  end

  def calc_income
    trips = self.trips
    total = 0

    if trips.length == 0
      return 0
    end

    trips.each do | trip |
      total += trip.cost
    end

    return total * 0.85
  end

end
