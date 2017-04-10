class AddCostToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :cost, :integer
  end
end
