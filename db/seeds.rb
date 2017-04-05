require "CSV"

CSV.foreach("support/passengers.csv", :headers => true) do |line|
  p = Passenger.new
  p.passenger_id = line[0].to_i
  p.name = line[1].to_s
  p.phone_num = line[2].to_s
  p.save

  puts "#{p.name} saved"
end

CSV.foreach("support/drivers.csv", :headers => true) do |line|
  d = Driver.new
  d.driver_id = line[0].to_i
  d.name = line[1].to_s
  d.vin = line[2].to_s
  # d.avg_rating = line[3]
  d.save

  puts "#{d.name} saved"
end

CSV.foreach("support/trips.csv", :headers => true) do |line|
  t = Trip.new
  t.trip_id = line[0].to_i
  t.driver_id = line[1].to_i
  t.passenger_id = line[2].to_i
  t.date = line[3].to_s
  t.rating = line[4].to_i
  t.save

  puts "#{t.trip_id} saved"
end
