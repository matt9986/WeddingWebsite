class CreateTourGuests < ActiveRecord::Migration
  def change
    create_table :tour_guests do |t|
      t.integer :tour_id
      t.integer :guest_id

      t.timestamps null: false
    end
    add_index :tour_guests, :tour_id
  end
end
