class Trip < ApplicationRecord
  attr_reader :total_cost
  belongs_to :driver
  belongs_to :rider

  def assign_cost
    @total_cost = rand(1..50)
  end
end
