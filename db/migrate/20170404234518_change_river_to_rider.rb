class ChangeRiverToRider < ActiveRecord::Migration[5.0]
  def change
    rename_column :trips, :river_id, :rider_id
  end
end
