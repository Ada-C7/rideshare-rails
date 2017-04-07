class DropIdFromDrivers < ActiveRecord::Migration[5.0]
  def change
    remove_column :drivers, :driver_id
  end
end
