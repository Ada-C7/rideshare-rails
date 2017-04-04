# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

csv_text = File.read(Rails.root.join('support', 'trips.csv' ))
csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    t = Trip.new
    t.id = row[0]
    t.driver_id = row[1]
    t.passenger_id = row[2]
    t.date = row[3]
    t.rating = row[4]
    t.price = rand(1..20)
    t.save
  end

  csv_text_passenger = File.read(Rails.root.join('support', 'passengers.csv' ))
  csv_passenger = CSV.parse(csv_text_passenger, :headers => true)
    csv_passenger.each do |row|
      t = Passenger.new
      t.id = row[0]
      t.name = row[1]
      t.phone_num = row[2]
      t.save
    end

    csv_text_driver = File.read(Rails.root.join('support', 'drivers.csv' ))
    csv_driver = CSV.parse(csv_text_driver, :headers => true)
      csv_driver.each do |row|
        t = Driver.new
        t.id = row[0]
        t.name = row[1]
        t.vin = row[2]
        t.save
      end
