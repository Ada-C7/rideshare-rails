class Passenger < ApplicationRecord
     has_many :trips

     def self.select_driver
          @trips = Trip.all
          @drivers = @trips.map { | trip |  trip.driver if trip.driver.status == true}
          return @drivers.sample
     end

     validates :name, presence: { message: "Please provide the passenger's name." }
     validates :phone, presence: { message: "Please enter the passenger's phone number." }
end
