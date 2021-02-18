class AddUserIdToReservations < ActiveRecord::Migration[6.0]
  def change
    add_reference :reservations, :user, foreign_key: true
  end
end
