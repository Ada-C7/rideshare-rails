require "csv"
table = CSV.read("trips.csv", {headers: true, col_sep: ","})

# Add another col, row by row:
table.each do |row|
  row["cost"] = rand(1..100) + (rand(0..100) / 100.0)
end

# write to file
CSV.open("trips-2.csv", "w") do |f|
  f << table.headers
  table.each{|row| f << row}
end
