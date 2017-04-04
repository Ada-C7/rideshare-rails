require "CSV"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# passengers = []

CSV.foreach("support/passengers.csv", :headers => true) do |line|
  p = Passenger.new
  p.passenger_id = line[0].to_i
  p.name = line[1].to_s
  p.phone_num = line[2].to_s
  p.save

  puts "#{p.name} saved"

  # passengers << Passenger.create(:passenger_id => line[0].to_i, :name => line[1].to_s,
  # :phone_num => line[2].to_s)

end

# passengers = [
#   {
#     name: "Sandi Metz"
#   },
#   {
#     name: "Chantal"
#   }
# ]
#
# passengers.each do |passenger|
#   Passenger.create(passenger)
# end
