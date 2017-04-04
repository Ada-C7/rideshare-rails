class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  validates :cost, presence: true, numericality: { only_integer: true, greater_than: 100 }

  validates :rating, presence: true
end
