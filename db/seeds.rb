require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'passengers.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  pass = Passenger.new
  pass.passenger_id = row['passenger_id']
  pass.name = row['name']
  pass.phone_num = row['phone_num']
  pass.save
  puts "#{pass.passenger_id}, #{pass.name}, #{pass.phone_num} saved!"
end

puts "There are now #{Passenger.count} rows in the passengers table"
