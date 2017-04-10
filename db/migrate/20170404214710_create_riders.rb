class CreateRiders < ActiveRecord::Migration[5.0]
  def change
    create_table :riders do |t|
      t.string :name
      t.string :phone

      t.timestamps
    end
  end
end
