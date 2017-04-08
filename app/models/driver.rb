class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :vin, presence: true, length: { is: 17 }

  def av_rating(id)
    all_ratings = []
    yo_trips = Driver.find(id).trips

    yo_trips.each do |trip|
      all_ratings << trip.rating
    end

    @average = all_ratings.reduce(:+)/all_ratings.length
  end

  def say
    puts "You are here"
  end
end
