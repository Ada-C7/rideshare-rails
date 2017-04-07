class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  validates :driver_id, presence: true
  validates :passenger_id, presence: true
  validates :date, presence: true
  validates :rating, presence: true
  validates :cost, presence: true

  def next(id)
    this_trip = Trip.find(id)
    trips = this_trip.passenger.trips
    trips.where("id > ?", self.id).first
  end

  def prev(id)
    this_trip = Trip.find(id)
    trips = this_trip.passenger.trips
    trips.where("id < ?", self.id).last
  end

  def self.search_passenger(search)
    where("passenger.name ILIKE ?", "%#{search}%")
  end
  def self.search_driver(search)
    where("driver.name ILIKE ?", "%#{search}%")
  end
  def self.search_rating(search)
    where("rating ILIKE ?", "%#{search}%")
  end
  def self.search_date(search)
    where('CAST(date AS text) LIKE ?', "%#{search}%")
  end
  def self.search_cost(search)
    where("cost ILIKE ?", "%#{search}%")
  end
end
