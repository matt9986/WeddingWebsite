class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
