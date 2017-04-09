class Rider < ApplicationRecord
  has_many :trips
  validates :name, presence: true

  validates :phone, presence: true


  def self.active_riders
    @active_riders if defined? @active_riders
    @active_riders = Array.new
    Rider.all.each do |rider|
      if rider.active
        @active_riders << rider
      end
    end
    return @active_riders

  end

  def total_cost
    total_cost = 0
    trips.each do  |trip|
      total_cost += trip.cost
    end
    return total_cost
  end


end
