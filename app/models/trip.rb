class Trip < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver
  validates :driver_id, presence: true
  validates :passenger_id, presence: true
end

#not sure the syntax of the [foreign_key..] thing...looking up
#e.g., add_foreign_key :drivers, :trips

# randomizing a drvier for a new trip? This link may e helpful - http://stackoverflow.com/questions/9697133/how-to-randomize-array-element-positions-of-an-activerecordrelation
# a = drivers.all.shuffle
