require 'csv'

#RIDER
csv_text = File.read(Rails.root.join('lib', 'seeds', 'passengers.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  r = Rider.new

  r.name = row['name']
  r.phone_num = row['phone_num']
  r.save
end

#DRIVER
  csv_text = File.read(Rails.root.join('lib', 'seeds', 'drivers.csv'))
  csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
  csv.each do |row|
    d = Driver.new

    d.name = row['name']
    d.vin = row['vin']
    d.save
end


#TRIPS
csv_text = File.read(Rails.root.join('lib', 'seeds', 'trips.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Trip.new
  t.driver_id= row['driver_id'].to_i
  t.rider_id = row['rider_id'].to_i
  # t.date = row['date']
  t.rating = row['rating'].to_i
  t.save
end
