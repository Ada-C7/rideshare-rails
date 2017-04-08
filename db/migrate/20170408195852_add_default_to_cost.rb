class AddDefaultToCost < ActiveRecord::Migration[5.0]
  def change
    change_column :trips, :cost, :float, :default => 0.00
  end
end
