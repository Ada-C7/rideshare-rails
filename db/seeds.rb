require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


drivers = []
CSV.read("../support/drivers.csv"[1..-1]).each do |line|
  drivers << {
    name: line[1],
    vin: line[2],
    status: (line[3] == "true" ? true : false)
  }
end

driver_successes = 0
drivers.each do |driver|
  driver = Driver.new(driver)
  driver.save
  if driver.id
    driver_successes += 1
  else
    # puts "FAILED ON #{driver[:name]}"
  end
end

puts "Created #{driver_successes} out of #{drivers.length} drivers."


passengers = []
CSV.read("../support/passengers.csv"[1..-1]).each do |line|
  passengers << {
    name: line[1],
    phone: line[2],
  }
end

# passenger_successes = 0
# passengers.each do |passenger|
#   passenger = Passenger.new(passenger)
#   passenger.save
#   if passenger.id
#     passenger_successes += 1
#   else
#     puts "FAILED ON #{passenger[:name]}"
#   end
# end
#
# puts "Created #{passenger_successes} out of #{passengers.length} passengers."

trips = []
CSV.read("../support/trips.csv"[1..-1]).each do |line|
  trips << {
    driver_id: line[1].to_i,
    passenger_id: line[2].to_i,
    date: line[3],
    rating: line[4].to_i,
    cost: line[5].to_f
  }
end

trip_successes = 0
trips.each do |trip|
  trip = Trip.create(trip)
  if trip.id
    trip_successes += 1
  else
    puts "FAILED ON Trip with cost #{trip[:cost]}"
  end
end

puts "Created #{trip_successes} out of #{trips.length} trips."
