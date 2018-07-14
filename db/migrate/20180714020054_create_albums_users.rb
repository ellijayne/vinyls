class CreateAlbumsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :albums_users, :id => false do |t|
        t.integer :album_id
        t.integer :user_id
    end
  end
end
