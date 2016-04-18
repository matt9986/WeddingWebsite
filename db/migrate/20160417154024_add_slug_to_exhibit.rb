class AddSlugToExhibit < ActiveRecord::Migration
  def change
    add_column :exhibits, :slug, :string
    add_index :exhibits, :slug, :unique => true
  end
end
