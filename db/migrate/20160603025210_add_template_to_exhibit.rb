class AddTemplateToExhibit < ActiveRecord::Migration
  def change
    add_column :exhibits, :template, :integer, null: false, default: 0
  end
end
