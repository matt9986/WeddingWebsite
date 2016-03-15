class CreateExhibits < ActiveRecord::Migration
  def change
    create_table :exhibits do |t|
      t.string :title
      t.text :body
      t.boolean :enable
      t.string :picture_url
      t.integer :order

      t.timestamps null: false
    end
  end
end
