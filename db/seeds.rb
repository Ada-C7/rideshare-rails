require 'csv'

rider_text = File.read(Rails.root.join('lib','seeds','passengers.csv'))

csv = CSV.parse(rider_text, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |row|
  r = Rider.new
  r.id = row['rider_id']
  r.name = row['name']
  r.phone_num = row['phone_num']
  r.save

  puts "Added: #{r.id} #{r.name}  #{r.phone_num} !"
end

puts "There are now #{Rider.count} rows in the table."
