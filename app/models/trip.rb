class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  validates :name, presence: true
  validates :name, uniqueness: true

  validates :vin, presence: true
  validates :vin, uniqueness: true
end
