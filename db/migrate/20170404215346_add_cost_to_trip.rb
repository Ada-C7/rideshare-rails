class AddCostToTrip < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :cost, :float
  end
end
