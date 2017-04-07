class Driver < ApplicationRecord
     has_many :drivers
     #
     validates :name,
          presence:
          { message: "Please provide the driver's name." }

     validates :vin,
          presence: { message: "Please enter the driver's VIN." },
          uniqueness: { message:
               "%{value} is associated with another driver. Do try once more."
          }
          
     validates :status,
          presence: { message: "Please select the driver's status." }
end
