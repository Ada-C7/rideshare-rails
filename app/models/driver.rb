class Driver < ApplicationRecord
  has_many :trips

     validates :name,
          presence:
          { message: "Please provide the driver's name." }

     validates :vin,
          presence: { message: "Please enter the driver's VIN." },
          uniqueness: { message:
               "%{value} is associated with another driver. Do try once more."
          },
          length: { is: 17, message: "VIN must be 17 characters." }

     validates_inclusion_of :status, {
          in: [true, false],
          message: "Please select the driver's status."
     }

    def earnings
          trip_payments = trips.map { |trip| trip.cost }
          total_payments = trip_payments.reduce(:+)
          earnings = total_payments * 0.85
          return sprintf('%.2f', earnings)
    end
end
