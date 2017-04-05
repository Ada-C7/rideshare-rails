class Trip < ApplicationRecord
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
