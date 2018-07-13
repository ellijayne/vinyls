class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.text :title
      t.integer :artist_id
      t.date :date
      t.text :tracks
      t.text :image

      t.timestamps
    end
  end
end
