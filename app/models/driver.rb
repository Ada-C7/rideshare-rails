class Driver < ApplicationRecord
  has_many :trips
  validates :name, presence: true
  validates :vin, presence: true, uniqueness: true

  scope :active, -> { where(active: true) }
  scope :availavle, -> { active }

  def average_rating
    return 1
  end

end
