class ChangeTripCostColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :trips, :cost, :cost_in_cents
  end
end
