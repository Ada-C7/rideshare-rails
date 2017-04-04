##Jamie showed us another way to import csv files and we decided to go with that.
#Saving this code for reference


# require 'csv'
#
# namespace :csv do
#
#   desc "Import CSV Data"
#   task :import_stuff => :environment do
#
#     csv_file_path = 'support/passengers.csv'
#
#     CSV.foreach(csv_file_path) do |row|
#       Rider.create!({
#         :id => row[0],
#         :name => row[1],
#         :phone_num => row[2],
#       })
#       puts "Row added!"
#     end
#   end
#
#
#   desc "Import CSV Data"
#   task :import_stuff => :environment do
#
#     csv_file_path = 'support/drivers.csv'
#
#     CSV.foreach(csv_file_path) do |row|
#       Driver.create!({
#         :id => row[0],
#         :name => row[1],
#         :vin => row[2],
#       })
#       puts "Row added!"
#     end
#   end
#
#
#   task :import_stuff => :environment do
#
#     csv_file_path = 'support/trips.csv'
#
#     CSV.foreach(csv_file_path) do |row|
#       Trip.create!({
#         :id => row[0],
#         :driver_id => row[1],
#         :rider_id => row[2],
#         :date => row[3],
#         :rating=> row[4],
#         :cost => rand(1..100)
#       })
#       puts "Row added!"
#     end
#   end
#
#
#
# end
