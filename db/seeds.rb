require 'csv'

rider_text = File.read(Rails.root.join('lib','seeds','passengers.csv'))

rider_csv = CSV.parse(rider_text, :headers => true, :encoding => 'ISO-8859-1')

rider_csv.each do |row|
  r = Rider.new
  r.id = row['rider_id']
  r.name = row['name']
  r.phone_num = row['phone_num']
  r.save

  puts "Added: #{r.id} #{r.name}  #{r.phone_num} !"
end

puts "There are now #{Rider.count} rows in the table."
#########################################################
driver_text = File.read(Rails.root.join('lib','seeds','drivers.csv'))

driver_csv = CSV.parse(driver_text, :headers => true, :encoding => 'ISO-8859-1')

driver_csv.each do |row|
  d = Driver.new
  d.id = row['driver_id']
  d.name = row['name']
  d.vin = row['vin']
  d.save

  puts "Added: #{d.id} #{d.name}  #{d.vin} !"
end

puts "There are now #{Driver.count} rows in the table."
########################################################
trip_text = File.read(Rails.root.join('lib','seeds','trips.csv'))

trip_csv = CSV.parse(trip_text, :headers => true, :encoding => 'ISO-8859-1')

trip_csv.each do |row|
  d = Trip.new
  d.id = row['trip_id']
  d.driver_id = row['driver_id']
  d.rider_id = row['rider_id']
  d.date = row['date']
  d.rating = row['rating']
  d.save

  puts "Added: #{d.id} #{d.driver_id}  #{d.date} !"
end

puts "There are now #{Trip.count} rows in the table."
