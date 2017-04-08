require 'csv'

drivers = CSV.read("support/drivers.csv")[1..-1].map do |line|
  {
    name: line[1],
    vin: line[2],
    status: (line[3] == "true" ? true : false)
  }
end


passengers = CSV.read("support/passengers.csv")[1..-1].map do |line|
  {
    name: line[1],
    phone: line[2],
  }
end


trips = CSV.read("support/trips.csv")[1..-1].map do |line|
  {
    driver_id: line[1],
    passenger_id: line[2],
    date: line[3],
    rating: line[4],
    cost: line[5]
  }
end

# #uncomment to keep track of which lines didn't pass validation
# driver_successes = 0
# drivers.each do |driver|
#   driver = Driver.create(driver)
#   if driver.id
#     driver_successes += 1
#   else
#     puts "FAILED ON #{driver[:name]}"
#   end
# end
#
# puts "Created #{driver_successes} out of #{drivers.length} drivers."
#
# passenger_successes = 0
# passengers.each do |passenger|
#   passenger = Passenger.create(passenger)
#   if passenger.id
#     passenger_successes += 1
#   else
#     puts "FAILED ON #{passenger[:name]}"
#   end
# end
#
# puts "Created #{passenger_successes} out of #{passengers.length} passengers."
#
# trip_successes = 0
# trips.each do |trip|
#   trip = Trip.create(trip)
#   if trip.id
#     trip_successes += 1
#   else
#     puts "FAILED ON Trip with cost #{trip[:cost]}"
#   end
# end
#
# puts "Created #{trip_successes} out of #{trips.length} trips."
