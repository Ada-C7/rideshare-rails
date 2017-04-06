class Passenger < ApplicationRecord
  has_many :trips

  validates :id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :phone_num, presence: true, uniqueness: true
end
