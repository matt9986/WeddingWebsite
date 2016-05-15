class AddPhotographsToExhibits < ActiveRecord::Migration
  def change
    add_column :exhibits, :photograph, :string
  end
end
