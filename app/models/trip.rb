class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  validates :date, presence: true
  validates :cost, presence: true, numericality: true
  validates :rating, numericality: { only_integer: true, :allow_nil => true, greater_than: 0, less_than: 6, message: "must be an integer between 1 and 5" }
  #inclusion: { in: 1..5, message: "must be between 1 and 5" }

  def self.find_driver
    # a driver of a trip that has yet to be rated is not available
    unavialbe_drivers = Trip.where(rating: nil).map {|trip| trip.driver.id}
    Driver.all.each do |driver|
      return driver unless unavialbe_drivers.include? driver.id
    end
    # render html: "No driver is currently available"
    return nil
  end

end
