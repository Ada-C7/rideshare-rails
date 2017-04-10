class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :rider


  validates :driver_id, presence: true,
                        numericality: { only_integer: true, greater_than: 0 }


  validates :rider_id, presence: true,
                       numericality: { only_integer: true, greater_than: 0 }

  validates :date, presence: true

  # reading in as string from CSV

  validates :cost, presence: true,
                   numericality: { only_integer: true }


end
