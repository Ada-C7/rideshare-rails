class Rider < ApplicationRecord
  validates :name, presence: true
  validates :phone_num, presence: true, length: {is: 10}

  has_many :trips

  def average_rating
    if self.trips.size > 0
        self.trips.average(:rating)
    else
        'undefined'
    end
  end
end
