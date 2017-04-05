class Rider < ApplicationRecord
  has_many :trips

  def average_rating
    if self.trips.size > 0
        self.trips.average(:rating)
    else
        'undefined'
    end
  end
end
