# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:





require 'csv'
csv_text = File.read(Rails.root.join('lib', 'seeds', 'passengers.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  r = Rider.new

  r.name = row['name']
  r.phone_num = row['phone_num']
  r.save
end
