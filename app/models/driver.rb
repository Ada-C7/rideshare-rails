class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :name, uniqueness: true

  validates :vin, presence: true
  validates :vin, uniqueness: true
end
