class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presense: true
  validates :phone_num, presense:true
end
