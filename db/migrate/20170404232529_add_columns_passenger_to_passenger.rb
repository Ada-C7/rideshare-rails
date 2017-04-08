class AddColumnsPassengerToPassenger < ActiveRecord::Migration[5.0]
  def change
    add_column :passengers, :passenger_id, :integer
    add_column :passengers, :name, :string
    add_column :passengers, :phone_num, :string
  end
end
