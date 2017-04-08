class AddModelRelationships < ActiveRecord::Migration[5.0]
  def change
    add_reference :trips, :driver, foreign_key: true
    add_reference :trips, :rider, foreign_key: true
  end
end
