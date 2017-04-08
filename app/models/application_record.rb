class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def total_money
    trips.empty? ? 0 : trips.map {|trip| trip.cost}.reduce(:+)
  end

end
