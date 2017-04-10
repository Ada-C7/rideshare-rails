require 'csv'

csv_text1 = File.read(Rails.root.join('lib', 'seeds', 'passengers.csv'))
csv1 = CSV.parse(csv_text1, :headers => true, :encoding => 'ISO-8859-1')
csv1.each do |row|
  pass = Passenger.new
  pass.name = row['name']
  pass.phone_num = row['phone_num']
  pass.save
  puts "#{pass.name}, #{pass.phone_num} saved!"
end

puts "There are now #{Passenger.count} rows in the passengers table"


csv_text2 = File.read(Rails.root.join('lib', 'seeds', 'drivers.csv'))
csv2 = CSV.parse(csv_text2, :headers => true, :encoding => 'ISO-8859-1')

csv2.each do |row|
  driver = Driver.new
  driver.name = row['name']
  driver.vin = row['vin']
  driver.save
  puts "#{driver.name}, #{driver.vin}saved!"
end

puts "There are now #{Driver.count} rows in the drivers table"


csv_text3 = File.read(Rails.root.join('lib', 'seeds', 'trips.csv'))
csv3 = CSV.parse(csv_text3, :headers => true, :encoding => 'ISO-8859-1')

csv3.each do |row|
  trip = Trip.new
  trip.passenger_id = row['passenger_id']
  trip.driver_id = row['driver_id']
  trip.date = row['date']
  trip.rating = row['rating']
  trip.save
  puts "#{trip.driver_id}, #{trip.passenger_id}, #{trip.date}, #{trip.rating} saved!"
end

puts "There are now #{Trip.count} rows in the trips table"
