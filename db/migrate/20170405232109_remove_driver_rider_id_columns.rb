class RemoveDriverRiderIdColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :trips, :driver_id
    remove_column :trips, :rider_id
  end
end
