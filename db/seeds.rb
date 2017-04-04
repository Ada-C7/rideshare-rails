# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

# csv_text = File.read(Rails.root.join('support', 'passengers.csv'))
#
# csv = CSV.parse(csv_text, :headers => true)
# csv.each do |row|
#   r = Rider.new
#   r.id = row['rider_id']
#   r.name = row['name']
#   r.phone_num = row["phone_num"]
#   r.save
# end

csv_text = File.read(Rails.root.join('support', 'drivers.csv'))

csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  r = Driver.new
  r.id = row['driver_id']
  r.name = row['name']
  r.vin = row["vin"]
  r.save
end
