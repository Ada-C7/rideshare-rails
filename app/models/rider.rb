class Rider < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :name, uniqueness:true

  validates :phone_num, presence: true

  def total_spending
    if self.trips.empty?
      0
    else
      self.trips.map { |trip| trip.fare}.reduce(:+)
    end
  end
end
