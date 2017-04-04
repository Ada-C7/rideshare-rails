# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

drivers = [
  {
     name: "Darth Vadar",
     vin: "3333333",
     status: true
  },
  {
      name: "Princess Leia",
      vin: "7777777",
      status: false
  },
  {
      name: "Han Solo",
      vin: "1111111",
      status: true
  }
]

drivers.each do |driver|
  Driver.create(driver)
end
