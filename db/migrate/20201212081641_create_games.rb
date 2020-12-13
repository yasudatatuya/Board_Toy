class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :genre, null: false, default: 0
      t.string :name
      t.string :image_id
      t.string :introduction
      t.integer :price
      t.integer :play_timemin
      t.integer :play_timemax
      t.integer :number_min
      t.integer :number_max

      t.timestamps
    end
  end
end
