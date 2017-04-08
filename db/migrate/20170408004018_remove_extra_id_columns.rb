class RemoveExtraIdColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :drivers, :driver_id
    remove_column :passengers, :passenger_id
    remove_column :trips, :trip_id
  end
end
