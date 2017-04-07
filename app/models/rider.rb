class Rider < ApplicationRecord
  validates :name, presence: true

  has_many :trips

  def trip_request
    driver = Driver.all.sample
    trips.create(rider: self,
                driver: driver,
                date: Date.today)
  end
end
