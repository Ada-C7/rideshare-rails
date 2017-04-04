class RenameRiderToRiders < ActiveRecord::Migration[5.0]
  def change
     rename_table :rider, :riders
  end
end
