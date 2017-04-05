class Driver < ApplicationRecord
  validates :name, presence: true
  validates :vin, presence: true, length: {is: 17}
  has_many :trips
end
