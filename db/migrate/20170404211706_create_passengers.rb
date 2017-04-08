class CreatePassengers < ActiveRecord::Migration[5.0]
  def change
    create_table :passengers do |t|
      t.integer :passenger_id
      t.string :name
      t.string :phone_num

      t.timestamps
    end
  end
end
