# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'


trips = []
temp_csv = CSV.read(Rails.root.join('support', 'trips.csv'))
temp_csv.shift
temp_csv.each do |trip|
  trip_hash = Hash.new
  trip_hash[:driver_id] = trip[1]
  trip_hash[:rider_id] = trip[2]
  trip_hash[:date] = trip[3]
  trip_hash[:rating] = trip[4]
  trip_hash[:cost] = rand(500..1500)

  trips << trip_hash
end

success_count = 0
trips.each do |t|
  trip = Trip.create(t)

  if trip.id
    success_count += 1
    puts "#{trip.id} successfully added"
  end
end

puts "#{success_count} out of #{trips.length} added."
