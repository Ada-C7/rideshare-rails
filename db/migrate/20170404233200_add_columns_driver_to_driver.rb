class AddColumnsDriverToDriver < ActiveRecord::Migration[5.0]
  def change
    add_column :drivers, :driver_id, :integer
    add_column :drivers, :name, :string
    add_column :drivers, :vin, :string
  end
end
