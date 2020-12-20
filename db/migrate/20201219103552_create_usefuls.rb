class CreateUsefuls < ActiveRecord::Migration[5.2]
  def change
    create_table :usefuls do |t|
      t.integer :user_id
      t.integer :game_comment_id

      t.timestamps
    end
  end
end
