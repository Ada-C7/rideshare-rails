class AddDriverRiderColActive < ActiveRecord::Migration[5.0]
  def change
    add_column :drivers, :active, :boolean, :default => true
    add_column :riders, :active, :boolean, :default => true
  end
end
