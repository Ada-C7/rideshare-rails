class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true, uniqueness: true

  # , format: {with: /\A[ a-zA-Z]+\z/, message: "only allows letters" }
  # Removing this for now b/c having trouble with CSV file!
  
  validates :vin, presence: true, uniqueness: true, length: { is: 17 }
  validates :availability, inclusion: { in: [true, false] }, allow_nil: true

  def avg_rating
    ratings_array = trips.map(&:rating)
    (ratings_array.sum / ratings_array.size.to_f).round(2)
  end

  def total_earnings
    cost_array = trips.map(&:cost)
    total = cost_array.sum
    return (total - (total * 0.15)).round(2)
  end

end
