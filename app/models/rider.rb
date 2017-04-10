class Rider < ApplicationRecord
  has_many :trips

  validates :name, presence: true, uniqueness: true
  # format: {with: /\A[ a-zA-Z]+\z/, message: "only allows letters" }
  # Removing this for now b.c cSV file is getting messed up.
  validates :phone_num, presence: true, uniqueness: true


  def total_cost
    cost_array = trips.map(&:cost)
    return (cost_array.sum).round(2)
  end

end
