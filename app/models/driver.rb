class Driver < ApplicationRecord
  has_many :trips

  def total_amount_earned
    total_amount_earned = 0
    self.trips.each do |trip|
      total_amount_earned += trip.price
    end
    total_amount_earned -= (total_amount_earned*0.15)
  end
end
