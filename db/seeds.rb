require "csv"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# seeding for drivers
drivers = []

CSV.foreach("support/drivers.csv", { :headers => true }) do |line|
  avail_status = true
  if rand(2) == 1
    avail_status = false
  end
  drivers << { name: line[1], vin: line[2], available: avail_status }
end

success_count = 0

drivers.each do |driver|
  temp_driver = Driver.create(driver)
  if temp_driver.id
    success_count += 1
    puts "#{temp_driver.name} successfully added. Status: #{temp_driver.available}"
  end
end

puts "#{success_count} out of #{drivers.length} successfully added"

# seeding for passngers
passengers = []

CSV.foreach("support/passengers.csv", { :headers => true }) do |line|
  passengers << {name: line[1], phone_num: line[2] }
end

success_count = 0

passengers.each do |passenger|
  temp_passenger = Passenger.create(passenger)
  if temp_passenger.id
    success_count += 1
    puts "#{temp_passenger.name} successfully added"
  end
end

puts "#{success_count} out of #{passengers.length} successfully added"

# seed for trips
trips = []

CSV.foreach("support/trips.csv", { :headers => true }) do |line|
  trips << {driver_id: line[1], passenger_id: line[2], rating: line[4], cost: line[5] }
end

success_count = 0

trips.each do |trip|
  temp_trip = Trip.create(trip)
  if temp_trip.id
    success_count += 1
    puts "trip number: #{temp_trip.id} successfully added"
  end
end

puts "#{success_count} out of #{trips.length} successfully added"
