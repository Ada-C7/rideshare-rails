class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      # t.integer :id
      t.integer :driver_id
      t.integer :passenger_id
      t.integer :rating
      t.string :date
      t.integer :price
      t.timestamps
    end
  end
end
