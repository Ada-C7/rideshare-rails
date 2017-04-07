class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :vin, presence: true, length: {is:17}
  #format: {with: /[a-zA-Z0-9]+/}

  def ave_rating
    return  "Not yet rated"  if self.trips.length == 0
    self.trips.map {|trip| trip.rating}.reduce(:+)/self.trips.length.to_f
  end

end
