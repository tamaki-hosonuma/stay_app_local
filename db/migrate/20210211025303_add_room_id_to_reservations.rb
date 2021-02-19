class AddRoomIdToReservations < ActiveRecord::Migration[6.0]
  def change
    add_reference :reservations, :room, foreign_key: true
  end
end
