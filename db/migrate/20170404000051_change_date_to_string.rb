class ChangeDateToString < ActiveRecord::Migration[5.0]
  def change
    change_column :trips, :date, :string
  end
end
