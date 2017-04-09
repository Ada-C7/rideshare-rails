class AddDateTrip < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :date, :string
  end
end
