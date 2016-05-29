class AddRsvpToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :rsvp, :integer, null: false, default: 0
  end
end
