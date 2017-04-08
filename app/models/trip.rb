class Trip < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver
  validates :driver_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :passenger_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
end


# randomizing a drvier for a new trip? This link may e helpful - http://stackoverflow.com/questions/9697133/how-to-randomize-array-element-positions-of-an-activerecordrelation
# a = drivers.all.shuffle
