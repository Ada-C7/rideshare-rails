class Passenger < ApplicationRecord
     has_many :trips

     validates :name, presence: { message: "Please provide the passenger's name." }
     validates :phone, presence: { message: "Please enter the passenger's phone number." }
end
