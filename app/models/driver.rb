class Driver < ApplicationRecord
  validates :name, presence: true
  validates :vin, presence: true, length: {is: 17}
  has_many :trips



  def average
    array_of_ratings = trips.all.collect {|t| t.rating}
    if array_of_ratings != []
      return array_of_ratings.sum.to_f/array_of_ratings.length
    else
      return Float::NAN
    end
  end
  
end
