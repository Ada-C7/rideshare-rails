class TripToDriverRelationship < ActiveRecord::Migration[5.0]
  def change
    add_reference :trips, :driver, foreign_key: true
  end
end
