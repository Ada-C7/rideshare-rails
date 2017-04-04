# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'drivers.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  d = Driver.new
  d.id = row['driver_id']
  d.name = row['name']
  d.vin = row['vin']
  d.save
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'passengers.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  r = Rider.new
  r.id = row['rider_id']
  r.name = row['name']
  r.phone_num = row['phone_num']
  r.save
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'trips.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Trip.new
  t.date = row['date']
  t.id = row['trip_id']
  t.driver_id = row['driver_id']
  t.rider_id = row['rider_id']
  t.rating = row['rating']
  t.cost = rand(1..100)
  t.save
end
