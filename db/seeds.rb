require "csv"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

drivers = []

CSV.foreach("support/drivers.csv", { :headers => true }) do |line|
  drivers << {name: line[1], vin: line[2], available: true }
end

success_count = 0

drivers.each do |driver|
  temp_driver = Driver.create(driver)
  if temp_driver.id
    success_count += 1
    puts "#{temp_driver.name} successfully added"
  end
end

puts "#{success_count} out of #{drivers.length} successfully added"
