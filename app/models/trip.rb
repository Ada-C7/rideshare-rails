class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :rider

  validates :driver_id, presence: true
  validates :rider_id, presence: true
  validates :fare, presence: true
  validates :rating, allow_nil: true, inclusion: { in: 1..5 }
end
