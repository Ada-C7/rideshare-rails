class Driver < ApplicationRecord
  has_many :trips
  has_many :passengers
  validates :name, presence: true, uniqueness: true
  validates :vin, presence: true, uniqueness: true
end
