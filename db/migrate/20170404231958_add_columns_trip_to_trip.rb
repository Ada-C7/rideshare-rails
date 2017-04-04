class AddColumnsTripToTrip < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :trip_id, :integer
    add_column :trips, :driver_id, :integer
    add_column :trips, :passenger_id, :integer
    add_column :trips, :date, :string
    add_column :trips, :rating, :integer
  end
end
