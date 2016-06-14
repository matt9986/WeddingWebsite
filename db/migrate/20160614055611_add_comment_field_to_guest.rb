class AddCommentFieldToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :rsvp_comment, :string
  end
end
