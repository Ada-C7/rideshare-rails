# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'





drivers = []
temp_csv = CSV.read(Rails.root.join('support', 'drivers.csv'))
temp_csv.shift
temp_csv.each do |driver|
  driver_hash = Hash.new
  driver_hash[:name] = driver[1]
  driver_hash[:vin] = driver[2]
  driver_hash[:active] = true

drivers << driver_hash
end

success_count = 0
drivers.each do |t|
  driver = Driver.create(t)

  if driver.id
    success_count += 1
    puts "driver #{driver.id} successfully added"
  end
end

riders = []
temp_csv = CSV.read(Rails.root.join('support', 'passengers.csv'))
temp_csv.shift
temp_csv.each do |rider|
  rider_hash = Hash.new
  rider_hash[:name] = rider[1]
  rider_hash[:phone] = rider[2]
  rider_hash[:active] = true
riders << rider_hash
end

success_count = 0
riders.each do |t|
  rider = Rider.create(t)

  if rider.id
    success_count += 1
    puts "rider #{rider.id} successfully added"
  end
end

trips = []
temp_csv = CSV.read(Rails.root.join('support', 'trips.csv'))
temp_csv.shift
temp_csv.each do |trip|
  trip_hash = Hash.new
  trip_hash[:driver_id] = trip[1]
  trip_hash[:rider_id] = trip[2]
  trip_hash[:date] = trip[3].to_date
  trip_hash[:rating] = trip[4]
  trip_hash[:cost] = rand(500..1500)

  trips << trip_hash
end

success_count = 0
trips.each do |t|
  trip = Trip.create(t)

  if trip.id
    success_count += 1
    puts "Trip #{trip.id} successfully added"
  else
    puts "#{trip.errors.messages}"
  end

end

puts "trip #{success_count} out of #{trips.length} added."
