class AddCostToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :cost, :float, :default => 0.0
  end
end
