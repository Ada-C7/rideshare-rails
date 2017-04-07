class Driver < ApplicationRecord
  attr_reader
  has_many :trips

  def avg_rating
    avg = trips.select('avg(trips.rating) as avg_rating').take&.avg_rating
    unless avg.nil?
      return avg.round(2)
    else
      return nil
    end
  end

  def earning_per_trip
    @earnings = Trip.total_cost * 0.85
  end
end
