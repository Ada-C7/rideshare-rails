# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'


driver_array = []
CSV.open('support/drivers.csv', 'r', :headers => true).each do |line|
  name = line["name"].to_s
  vin = line["vin"].to_s

  driver_array << {name: name, vin: vin}
end

Driver.create(driver_array)

rider_array = []
CSV.open('support/riders.csv', 'r', :headers => true).each do |line|
  name = line["name"].to_s
  phone_num = line["phone_num"].to_s

  rider_array << {name: name, phone_num: phone_num}
end

Rider.create(rider_array)

trip_array = []
CSV.open('support/trips.csv', 'r', :headers => true).each do |line|
  driver_id = line["driver_id"].to_i
  rider_id = line["rider_id"].to_i
  date = line["date"].to_s #need to change to date field
  rating = line["rating"].to_i

  trip_array << {driver_id: driver_id, rider_id: rider_id, date: date, rating: rating}
end

Trip.create(trip_array)
