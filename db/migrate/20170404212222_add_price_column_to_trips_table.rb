class AddPriceColumnToTripsTable < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :price, :integer
  end
end
