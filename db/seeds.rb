# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

driver_info = File.read(Rails.root.join('db', 'CSV', 'drivers.csv'))
user_info = File.read(Rails.root.join('db', 'CSV', 'riders.csv'))
trip_info = File.read(Rails.root.join('db', 'CSV', 'trips.csv'))
