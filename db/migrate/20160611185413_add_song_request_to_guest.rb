class AddSongRequestToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :song_request, :string
  end
end
