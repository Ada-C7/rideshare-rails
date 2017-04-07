# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'csv'

# drivers_csv_text = File.read( Rails.root.join('lib', 'seeds', 'drivers.csv') )
#
# csv_drivers = CSV.parse(drivers_csv_text, :headers => true)
# csv_drivers.each do |row|
#   driver = Driver.new
#   driver.name = row['name']
#   driver.vin = row['vin']
#   driver.save
# end
#
# passengers_csv_text = File.read( Rails.root.join('lib', 'seeds', 'passengers.csv'))
#
# csv_passengers = CSV.parse(passengers_csv_text, :headers => true)
# csv_passengers.each do |row|
#   passenger = Passenger.new
#   passenger.name = row['name']
#   passenger.phone_num = row['phone_num']
#   passenger.save
# end


trips_csv_text = File.read( Rails.root.join('lib', 'seeds', 'trips.csv') )

csv_trips = CSV.parse(trips_csv_text, :headers => true)
csv_trips.each do |row|
  trip = Trip.new
  trip.driver_id = row['driver_id']
  trip.passenger_id = row['passenger_id']
  trip.date = row['date']
  trip.rating = row['rating']
  # want to generate random cost unit will be cents
  trip.cost_in_cents = rand(100..10000)
  trip.save
end
