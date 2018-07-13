class CreatePressings < ActiveRecord::Migration[5.2]
  def change
    create_table :pressings do |t|
      t.integer :album_id
      t.integer :year
      t.boolean :limited
      t.text :color
      t.string :weight
      t.boolean :gatefold
      t.boolean :remastered
      t.integer :quantity_pressed
      t.boolean :virgin_vinyl
      t.string :lp_qty
      t.text :image

      t.timestamps
    end
  end
end
