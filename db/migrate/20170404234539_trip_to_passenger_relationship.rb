class TripToPassengerRelationship < ActiveRecord::Migration[5.0]
  def change
    add_reference :trips, :passenger, foreign_key: true
  end
end
