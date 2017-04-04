require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CSV.read(('../support/passengers.csv').path, :headers => :true).each do |passenger|
  Passenger.create(passenger)
end

CSV.read(('../support/drivers.csv').path, :headers => :true).each do |driver|
  Driver.create(driver)
end

CSV.read(('../support/trips.csv').path, :headers => :true).each do |trip|
  Trip.create(trip)
end
