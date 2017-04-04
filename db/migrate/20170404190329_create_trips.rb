class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.belongs_to :driver
      t.belongs_to :passenger
      t.integer :rating
      t.date :date

      t.timestamps
    end
  end
end
