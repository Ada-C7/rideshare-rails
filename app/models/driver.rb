class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :vin, presence: true, length: {is:17}, format: {with: /\A[a-zA-Z0-9]+\Z/}


end
