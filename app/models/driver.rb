class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true

  validates :vin, presence: true,
                  length: { is: 17 }, allow_blank: false

  def average_rating id
    driver = Driver.find id
    trip_count = 0
    total_rating = 0.0
    driver.trips.each do |trip|
      trip_count += 1
      total_rating += trip.rating
    end
    return (total_rating/trip_count).round(2)
  end



end
