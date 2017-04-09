# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

driver_info = File.read(Rails.root.join('db', 'CSV', 'drivers.csv'))
driver_info = CSV.parse(driver_info, :headers => true)

driver_info.each do |row|
  d = Driver.new
  d.name = row['name']
  d.vin = row['vin']
  d.is_driving = false
  d.save
  puts "#{d.name}, #{d.vin}"
end



user_info = File.read(Rails.root.join('db', 'CSV', 'riders.csv'))
user_info = CSV.parse(user_info, :headers => true)

user_info.each do |row|
  u = User.new
  u.name = row['name']
  u.phone_num = row['phone_num']
  u.save
  puts "#{u.name}, #{u.phone_num}"
end


trip_info = File.read(Rails.root.join('db', 'CSV', 'trips.csv'))
trip_info = CSV.parse(trip_info, :headers => true)

trip_info.each do |row|
  t = Trip.new
  t.driver_id = row['driver_id']
  t.user_id = row['rider_id']
  t.date = row['date']
  t.rating = row['rating']
  t.cost = rand((1.01)..(50.99)).round(2)
  t.save
  puts "#{t.cost} and #{t.date}"
end

puts "There are #{Driver.all.length} drivers saved out of #{driver_info.length}"
puts "There are #{User.all.length} users saved out of #{user_info.length}"
puts "There are #{Trip.all.length} trips saved out of #{trip_info.length}"
