class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string :date
      t.integer :rating
      t.timestamps
    end
  end
end
