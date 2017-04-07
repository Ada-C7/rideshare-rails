class Passenger < ApplicationRecord
  has_many :trips
  validates :name, presence: { message: "Name field cannot be blank." }
  validates :phone_num, uniqueness: true, presence: { message: "Phone Number field cannot be blank." }


  def total_amount_charged
    total_amount_charged = 0
    self.trips.each do |trip|
      total_amount_charged += trip.price
    end
    total_amount_charged
  end

  def all_trips_complete?
    self.trips.each do |trip|
      if trip.rating == nil
        return false
      end
    end
    return true
  end

end
