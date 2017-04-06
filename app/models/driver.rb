class Driver < ApplicationRecord
  has_many :trips
  validates :name, presence: true
  validates :vin, presence: true, uniqueness: true, length: { is: 17 }

  def self.find_driver
  end


  def rating
    rating = []

    self.trips.each do |trip|
      rating << trip.rating.to_f
    end
    
    return "Driver has no trips" if rating.length == 0

    rating = rating.select { |r| r != 0 }

    return (rating.reduce(:+) / rating.length).round(1)
  end

end
