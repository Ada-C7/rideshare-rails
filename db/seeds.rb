# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
require 'date'

#make array of rider parameter hashes

riders = CSV.read("db/support/riders.csv", {headers: true, converters: :all}).map do |line|
  { name: line[1], phone_num: line[2] }
end

# create new rider objects from array
failed_rider_count = 0
riders.each do |rider|
  current_rider = Rider.create(rider)

  if !current_rider.id
    failed_rider_count += 1
    puts "#{current_rider.name} failed to add"
  end
end
puts "#{failed_rider_count} out of #{riders.length} riders not successfully added"

#make array of driver parameter hashes

drivers = CSV.read("db/support/drivers.csv", {headers: true, converters: :all}).map do |line|
  { name: line[1], vin: line[2] }
end

# create new driver objects from array
failed_driver_count = 0
drivers.each do |driver|
  current_driver = Driver.create(driver)

  if !current_driver.id
    failed_driver_count += 1
    puts "#{current_driver.name} failed to add"
  end
end
puts "#{failed_driver_count} out of #{drivers.length} drivers not successfully added"

#make array of trip parameter hashes
trips = CSV.read("db/support/trips_with_cost.csv", {headers: true, converters: :all}).map do |line|
  { driver_id: line[1], rider_id: line[2], date: line[3], rating: line[4], fare: line[5] }
end

# create new trip objects from array
failed_trip_count = 0
trips.each do |trip|
  next if trip[:driver_id] == 0 || trip[:rider_id] == 0
  current_trip = Trip.create(trip)

  if !current_trip.id
    failed_trip_count += 1
    puts "Failed to add Driver ID: #{trip[:driver_id]}, Rider ID: #{trip[:rider_id]}, Date: #{trip[:date]}"
  end
end
puts "#{failed_trip_count} out of #{trips.length} trips not successfully added"

# Failed to add Driver ID: 61, Rider ID: 168, Date: 4/25/16
