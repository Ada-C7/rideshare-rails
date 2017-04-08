class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|

      t.belongs_to :rider
      t.belongs_to :driver

      t.integer :rating
      t.string :date

      t.timestamps
    end
  end
end
