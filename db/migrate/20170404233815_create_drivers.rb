class CreateDrivers < ActiveRecord::Migration[5.0]
  def change
    create_table :drivers do |t|
      t.integer :driver_id
      t.string :name
      t.string :vin
      t.integer :avg_rating

      t.timestamps
    end
  end
end
