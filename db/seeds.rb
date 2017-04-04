# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
drivers = []
      CSV.foreach("support/drivers.csv", {:headers => true, header_converters: :symbol, converters: :all}) do |line|
          drivers << RideShare::Driver.new(line)
      end

      authors.each do |author|
        Author.create(author)
      end
