class Trip < ApplicationRecord
  # LEARNING MOMENT:
  # by declaring that trip belongs to driver and passenger, when you validate with presence - rails magic
  # will auto check that the id is valid - ie in the db
  # also need to declare belong_to on seperate lines - can't combine with comma
  belongs_to :driver
  belongs_to :passenger

  validates :rating, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 6 }
  validates :driver_id, presence: true
  validates :passenger_id, presence: true
  validates :date, presence: true
  validates :cost, presence: true

end
