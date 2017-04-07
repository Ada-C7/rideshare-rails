class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true

  validates :phone, presence: true
  validates :phone, uniqueness: true

  def all_trips_rated?
    all_trips = self.trips.all
    all_trips.each do |trip|
      if trip.rating == 0
        return false
      end
    end
  end

  def total_charged
    total = 0
    self.trips.each do |trip|
      total += trip.cost
    end
    return total.round(2)
  end

  def next
    Passenger.where("id > ?", self.id).first
  end

  def prev
    Passenger.where("id < ?", self.id).last
  end

  def self.search(search)
    where("name ILIKE ? OR phone ILIKE ?", "%#{search}%", "%#{search}%")
  end

end
