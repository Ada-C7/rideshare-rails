class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.belongs_to :driver
      t.belongs_to :riders
      t.date :date
      t.integer :rating

      t.timestamps
    end
  end
end
