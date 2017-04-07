class Trip < ApplicationRecord
     belongs_to :driver
     belongs_to :passenger

<<<<<<< HEAD
     
     validates :date,
          presence: { message: "Please enter valid date." }
=======
     validates :date,
          presence:
          { message: "Please provide a valid date." }
>>>>>>> janice/business-logic

     validates :cost,
          presence: { message: "Please enter at least one dollar." }

     validates :driver_id,
          presence: { message: "Please select a driver." }

     validates :passenger_id,
          presence: { message: "Please select a passenger." }
end
