require 'csv'

# passengers
passenger_file = Rails.root.join('lib', 'seeds', 'passengers.csv')

CSV.foreach(passenger_file, headers: true) do |row|
  Passenger.create(name: row['name'], phone_number: row['phone_num'])
end

# drivers
driver_file = Rails.root.join('lib', 'seeds', 'drivers.csv')

CSV.foreach(driver_file, headers: true) do |row|
  Driver.create(name: row['name'], vin: row['vin'])
end

# trips
trip_file = Rails.root.join('lib', 'seeds', 'trips.csv')

CSV.foreach(trip_file, headers: true) do |row|
  if row['driver_id'] != "0" && row['passenger_id'] != "0"
    Trip.create(driver_id: row['driver_id'].to_i, passenger_id: row['passenger_id'].to_i,
      date: row['date'].to_date, rating: row['rating'].to_i)
  end
end
