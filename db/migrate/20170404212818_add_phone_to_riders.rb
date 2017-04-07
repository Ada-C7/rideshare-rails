class AddPhoneToRiders < ActiveRecord::Migration[5.0]
  def change
    add_column :riders, :phone_num, :string
  end
end
