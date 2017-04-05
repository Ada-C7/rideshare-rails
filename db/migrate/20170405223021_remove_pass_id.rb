class RemovePassId < ActiveRecord::Migration[5.0]
  def change
    remove_column :passengers, :passenger_id
  end
end
