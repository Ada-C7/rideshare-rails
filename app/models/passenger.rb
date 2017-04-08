class Passenger < ApplicationRecord
  has_many :trips
  validates :name, presence: true, length: { minimum: 2 }
  validates :phone_num, presence: true

  def calculate_charges
    return nil if trips.empty?
    total_cost_in_cents = trips.map { |trip| trip.cost_in_cents.to_f }.sum
    passengers_charges = total_cost_in_cents / 100
    passengers_charges
  end
end
