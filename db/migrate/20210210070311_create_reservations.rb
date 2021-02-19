class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.date :start
      t.date :end
      t.integer :num_people

      t.timestamps
    end
  end
end
