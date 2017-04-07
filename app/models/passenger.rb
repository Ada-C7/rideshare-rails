class Passenger < ApplicationRecord
  has_many :trips
  has_many :drivers
  validates :name, presence: true, uniqueness: true
end
