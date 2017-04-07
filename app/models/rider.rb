class Rider < ApplicationRecord
  has_many :trips
  validates :name, presence: true
  validates :name, format: {with: /[a-zA-Z]+/}

  validates :phone_num, presence: true

  def total_amount
    total = 0
    self.trips.each do |trip|
      if trip.cost == nil
        next
      else
        total += trip.cost
      end
    end
    return total
  end


    def trips_rated?


      return true
    end



end
