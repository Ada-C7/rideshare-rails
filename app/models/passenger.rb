class Passenger < ApplicationRecord
  has_many :trips
  validates :name, presence: true, length: { minimum: 2 }
  validates :phone_num, presence: true
end
