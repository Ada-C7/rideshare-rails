class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string :date
      t.integer :rating
      # add_foreign_key :trips, :drivers
      # add_foreign_key :trips, :riders

      t.belongs_to :driver
      t.belongs_to :river

      t.timestamps
    end
  end
end
