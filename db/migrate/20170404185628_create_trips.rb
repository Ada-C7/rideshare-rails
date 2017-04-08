class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.integer :driver_id
      t.integer :passenger_id
      t.integer :rating
      t.string :date
      t.timestamps
    end
  end
end
