class CreateGamecomments < ActiveRecord::Migration[5.2]
  def change
    create_table :gamecomments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :game_id
      t.float :star
      t.timestamps
    end
  end
end
