class Trip < ApplicationRecord
  validates :driver_id, presence: true,
                        uniqueness: true,
                        numericality: { only_integer: true }


  validates :rider_id, presence: true
                       uniqueness: true,
                       numericality: { only_integer: true }

  validates :date, presence: true

  validates :cost, presence: true

end
