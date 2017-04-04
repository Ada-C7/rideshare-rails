class CreatePassengers < ActiveRecord::Migration[5.0]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :phone_num
      # t.has_many :trips
      t.timestamps
    end
  end
end
