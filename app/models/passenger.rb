class Passenger < ApplicationRecord
  has_many :trips

  def total_amount_charged
    total_amount_charged = 0
    array = self.trips
    array.each do |trip|
      total_amount_charged += trip.price
    end
    total_amount_charged
  end

end
