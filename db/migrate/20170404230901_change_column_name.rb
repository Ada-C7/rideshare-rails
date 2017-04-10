class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :drivers, :availabilty, :availability
  end
end
