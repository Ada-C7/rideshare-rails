class Trip < ApplicationRecord
  validates :driver_id, numericality: { only_integer: true, greater_than: 0 }
  validates :rider_id, numericality: { only_integer: true, greater_than: 0 }

  belongs_to :driver
  belongs_to :rider





  def average_rating
    if self.rating.size > 0
        self.rating.average(:rating)
    else
        'undefined'
    end
  end

end
