class Driver < ApplicationRecord
     has_many :trips

     validates :name,
          presence:
          { message: "Please provide the driver's name." }

     validates :vin,
          presence: { message: "Please enter the driver's VIN." },
          uniqueness: { message:
               "%{value} is associated with another driver. Do try once more."
          }

     validates_inclusion_of :status,
          in: [true, false],
          message: "Please select the driver's status."
end
