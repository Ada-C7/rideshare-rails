class Driver < ApplicationRecord
  validates :name, presence: true
  validates :vin, presence: true, length: {is: 17}
  has_many :trips

  def show_trip
    trips.all
  end

  def average_rating
    array_of_ratings = trips.all.collect {|t| t.rating}
    if array_of_ratings != []
      avg = array_of_ratings.sum.to_f/array_of_ratings.length
      return avg.round(1)
    else
      return "-"
    end
  end

end
