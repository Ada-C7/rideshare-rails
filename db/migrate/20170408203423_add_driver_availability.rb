class AddDriverAvailability < ActiveRecord::Migration[5.0]
  def change
    add_column :drivers, :availability, :boolean, :default => false
  end
end
