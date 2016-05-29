class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :first
      t.string :last
      t.string :alias

      t.timestamps null: false
    end
  end
end
