class AddUserColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :phone_num, :string
    add_column :trips, :driver_id, :integer
    add_column :trips, :user_id, :integer
    add_column :trips, :rating, :integer
  end
end
