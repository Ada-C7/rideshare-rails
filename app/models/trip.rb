class Trip < ApplicationRecord
  belongs_to :rider
  belongs_to :driver


    validates :date, presence: true
    validates :date, format: {with: /[1-9\-\/]+/}

    validates :rider_id, presence: true
    validates :rider_id, numericality: {greater_than: 0}

    validates :driver_id, presence: true
    validates :driver_id, numericality: {greater_than: 0}

end
