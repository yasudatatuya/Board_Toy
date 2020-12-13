class AddIfchildrenToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :ifchildren, :boolean, default: false, null: false
    add_column :games, :ifeasy, :boolean, default: false, null: false
    add_column :games, :ifhard, :boolean, default: false, null: false
  end
end
