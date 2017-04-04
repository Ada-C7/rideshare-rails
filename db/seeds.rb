# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



require 'csv'

#make array of rider parameter hashes

riders = CSV.read("support/riders.csv", {headers: true, converters: :all}).map do |line|
  { name: line[1], phone_num: line[2] }
end

# create new rider objects from array
rider_count = 0
riders.each do |rider|
  current_rider = Rider.create(rider)

  if current_rider.id
    rider_count += 1
    puts "#{current_rider.name} successfully added"
  end
end
puts "#{success_count} out of #{riders.length} successfully added"
#make array of driver parameter hashes

drivers = CSV.read("db/support/drivers.csv", {headers: true, converters: :all}).map do |line|
  { name: line[1], vin: line[2] }

end

#make array of trip parameter hashes
trips = CSV.read("db/support/trips_with_cost.csv", {headers: true, converters: :all}).map do |line|
  { driver_id: line[1], rider_id: line[2], date: line[3], rating: line[4], fare: line[5] }

end
