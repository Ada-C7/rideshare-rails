class Rider < ApplicationRecord
  has_many :trips
  validates :name, presence: true

  validates :phone, presence: true

  def total_cost
    total_cost = 0
    trips.each do  |trip|
      total_cost += trip.cost
    end
    return total_cost
  end


end
