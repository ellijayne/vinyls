class CreateArtistsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :artists_users, :id => false do |t|
      t.integer :artist_id
      t.integer :song_id
    end
  end
end
