class Driver < ApplicationRecord

  has_many :trips

  def total_earnings
    trips_array = trips

    cost_array = []

    trips_array.each do |trip|
      cost_array << trip.cost
    end

    cost = cost_array.sum

    total_earnings = cost - (cost * (15/100))
  end
end
