# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
# require 'csv'
#
#
# # driver_array = []
# CSV.open('support/drivers.csv', 'r', :headers => true).each do |line|
#   name = line["name"]
#   vin = line["vin"]
#
#   # driver_array << {name: name, vin: vin, availability: true}
#   Driver.create({name: name, vin: vin, availability: true})
# end
#
# # rider_array = []
# CSV.open('support/riders.csv', 'r', :headers => true).each do |line|
#   name = line["name"].to_s
#   phone_num = line["phone_num"].to_s
#
#   Rider.create({name: name, phone_num: phone_num})
# end
#
# # trip_array = []
# CSV.open('support/trips.csv', 'r', :headers => true).each do |line|
#   driver_id = line["driver_id"].to_i
#   rider_id = line["rider_id"].to_i
#   date = line["date"].to_s #need to change to date field
#   rating = line["rating"].to_i
#
#   cost = (rand(0.00...100.00)).round(2)
#   {driver_id: driver_id, rider_id: rider_id, date: date, rating: rating, cost: cost }
#   Trip.create({driver_id: driver_id, rider_id: rider_id, date: date, rating: rating, cost: cost })
# end
