class AddTitleToGameComments < ActiveRecord::Migration[5.2]
  def change
    add_column :game_comments, :title, :string
  end
end
