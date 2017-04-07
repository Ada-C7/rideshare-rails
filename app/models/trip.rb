class Trip < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver
  validates :driver_id, presence: true
  validates :passenger_id, presence: true
end

#not sure the syntax of the [foreign_key..] thing...looking up
#e.g., add_foreign_key :drivers, :trips
