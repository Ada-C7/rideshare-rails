class Trip < ApplicationRecord
  belongs_to :rider
  belongs_to :driver

  # will need to add error messages in views, and possibly more validations 

  validates :driver_id, presence: true
  validates :rider_id, presence: true
  validates :date, presence: true
  validates :rating, presence: true
end
