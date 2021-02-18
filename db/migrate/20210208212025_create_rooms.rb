class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :title
      t.string :area
      t.string :address
      t.integer :price
      t.text :content
      t.string :image_name

      t.timestamps
    end
  end
end
