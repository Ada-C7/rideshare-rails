class Rider < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :name, format: {with: /[a-zA-Z]+/}

  validates :phone_num, presence: true

  def total_amount
    total = 0
    self.trips.each do |trip|
      total += trip.cost
    end
    return total
  end


    def trips_rated?
      self.trips.each do |trip|
        if trip.rating == nil
          return false
        end
      end
      return true
    end



end
