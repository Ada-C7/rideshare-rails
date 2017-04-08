require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

csv_driver = File.read(Rails.root.join('lib', 'seeds', 'drivers.csv'))

csv_d = CSV.parse(csv_driver, :headers => true)

csv_d.each do |row|
  driver = Driver.new
  driver.id = row['driver_id']
  driver.name = row['name']
  driver.vin = row['vin']
  driver.save!
end

csv_passenger = File.read(Rails.root.join('lib', 'seeds', 'passengers.csv'))

csv_p = CSV.parse(csv_passenger, :headers => true)

csv_p.each do |row|
  passenger = Passenger.new
  passenger.id = row['passenger_id']
  passenger.name = row['name']
  passenger.phone_num = row['phone_num']
  passenger.save!
end

csv_trip = File.read(Rails.root.join('lib', 'seeds', 'trips.csv'))

csv_t = CSV.parse(csv_trip, :headers => true)

csv_t.each do |row|
  trip = Trip.new
  trip.id = row['trip_id']
  trip.driver_id = row['driver_id']
  trip.passenger_id = row['passenger_id']
  trip.date = row['date']
  trip.rating = row['rating']
  trip.save!
end
