class Driver < ApplicationRecord
  has_many :trips

  def avg_rating
    trips.select('avg(trips.rating) as avg_rating').take&.avg_rating.round(2)
  end
end
