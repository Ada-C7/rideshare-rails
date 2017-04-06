class Driver < ApplicationRecord
  has_many :trips
  
  validates :id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :vin, presence: true, uniqueness: true, length: (17)
  validates :avg_rating, presence: true
end
