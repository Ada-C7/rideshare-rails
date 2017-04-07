# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'csv'
#
# drivers = '/Users/jou-jousun/ada/rails/rideshare-rails/support/drivers.csv'
# driver_data = []
# CSV.open(drivers, headers: true).each do |row|
#   driver_data << row.to_hash
# end
#
# riders = "/Users/jou-jousun/ada/rails/rideshare-rails/support/passengers.csv"
# rider_data = []
# CSV.open(riders, headers: true).each do |row|
#   rider_data << row.to_hash
# end
#
# trips = "/Users/jou-jousun/ada/rails/rideshare-rails/support/trips.csv"
# trip_data = []
# CSV.open(trips, headers: true).each do |row|
#   trip_data << row.to_hash
# end

require 'csv'

#what are these parameters actually doing??
driver_csv = File.read(Rails.root.join('support', 'drivers.csv'))
driver = CSV.parse(driver_csv, :headers => true, :encoding => 'ISO-8859-1')
driver.each do |row|
    d = Driver.new
    d.name = row['name']
    d.vin = row['vin']
    d.save
end
puts "There are now #{Driver.count} rows in the drivers table"

rider_csv = File.read(Rails.root.join('support', 'passengers.csv'))
rider = CSV.parse(rider_csv, :headers => true, :encoding => 'ISO-8859-1')
rider.each do |row|
    r = Rider.new
    r.name = row['name']
    r.phone_num = row['phone_num']
    r.save
end
puts "There are now #{Rider.count} rows in the riders table"

csv_text = File.read(Rails.root.join('support', 'trips.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Trip.new
  t.driver_id = row['driver_id']
  t.rider_id = row['rider_id']
  t.cost = row['cost']
  t.rating = row['rating']
  t.save
  puts "#{t.id}, #{t.driver_id} saved"
end

puts "There are now #{Trip.count} rows in the trips table"
