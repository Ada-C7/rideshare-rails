class Trip < ApplicationRecord
validates :driver_id, presence: true, numericality: true
validates :passenger_id, presence: true, numericality: true
validates :date, presence: true
validates :price, presence: true, numericality: true
end
