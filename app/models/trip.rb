class Trip < ApplicationRecord
  belongs_to :rider
  belongs_to :driver


    validates :date, presence: true
    validates :date, format: {with: /[1-9\-\/]+/}

    validates :cost, presence: true
    validates :cost, numericality: {:greater_than_or_equal_to => 0} 

end
