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
    joins(:passenger).where("name ILIKE ?", "%#{search}%")
  end

  def self.search_driver(search)
    joins(:driver).where("name ILIKE ?", "%#{search}%")
  end

  def self.search_rating(search)
    where('CAST(rating AS text) ILIKE ?', "%#{search}%")
  end

  def self.search_date(search)
    where('CAST(date AS text) ILIKE ?', "%#{search}%")
  end

  def self.search_cost(search)
    where('CAST(cost AS text) ILIKE ?', "%#{search}%")
  end
end
