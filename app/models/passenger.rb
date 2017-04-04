class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true

  validates :phone, presence: true
  validates :phone, uniqueness: true
end
