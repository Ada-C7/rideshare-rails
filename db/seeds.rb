require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'passengers.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  pass = Passenger.new
  pass.name = row['name']
  pass.phone_num = row['phone_num']
  pass.save
  puts "#{pass.name}, #{pass.phone_num} saved!"
end

puts "There are now #{Passenger.count} rows in the passengers table"


csv_text2 = File.read(Rails.root.join('lib', 'seeds', 'trips.csv'))
csv2 = CSV.parse(csv_text2, :headers => true, :encoding => 'ISO-8859-1')

csv2.each do |row|
  trip = Trip.new
  trip.driver_id = row['driver_id']
  trip.passenger_id = row['passenger_id']
  trip.date = row['date']
  trip.rating = row['rating']
  trip.save
  puts "#{trip.driver_id}, #{trip.passenger_id}, #{trip.date}, #{trip.rating} saved!"
end

puts "There are now #{Trip.count} rows in the passengers table"
