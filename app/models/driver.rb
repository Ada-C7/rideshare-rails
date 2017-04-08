class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :vin, presence: true, length: {is:17}, format: {with: /\A[a-zA-Z0-9]+\Z/}


  def ave_rating
    return nil if trips.length == 0
    trips.map {|trip| trip.rating}.reduce(:+)/trips.length.to_f
  end

end
