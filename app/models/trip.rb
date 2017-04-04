class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :rider

  validates :driver_id, presence: true
  validates :rider_id, presence: true
  validates :date, presence: true
  validates :fare, presence: true
end
