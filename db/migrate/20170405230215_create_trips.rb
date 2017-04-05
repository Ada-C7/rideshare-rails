class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.datetime :date
      t.decimal :cost
      t.integer :rating
      t.belongs_to :driver
      t.belongs_to :passenger
      t.timestamps
    end
  end
end
