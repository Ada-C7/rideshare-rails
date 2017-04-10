class Driver < ApplicationRecord
  has_many :trips

  def avg_rating
    avg = trips.select('avg(trips.rating) as avg_rating').take&.avg_rating
    unless avg.nil?
      return avg.round(2)
    else
      return nil
    end
  end

  # def total_earnings
  #   total = trips.select('sum(trips.cost) as total').take&.total
  #   return total * 0.85
  # end
end
