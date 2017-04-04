class Driver < ApplicationRecord
  has_many :trips

  validates :name, presense: true
  validates :vin, presense:true, uniqueness: true
end
