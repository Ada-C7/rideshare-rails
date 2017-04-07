class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

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
