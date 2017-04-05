class Trip < ApplicationRecord
  validates :driver_id, presence: true,
                        numericality: { only_integer: true }


  validates :rider_id, presence: true,
                       numericality: { only_integer: true }

  validates :date, presence: true

  # reading in as string from CSV

  validates :cost, presence: true,
                   numericality: { only_integer: true }


end
