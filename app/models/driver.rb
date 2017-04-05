class Driver < ApplicationRecord
    has_many :trips

    def total_amount
      total = 0
      self.trips.each do |trip|
        total += trip.cost
      end
      return total
    end
end
