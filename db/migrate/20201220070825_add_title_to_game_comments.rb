class AddTitleToGameComments < ActiveRecord::Migration[5.2]
  def change
    create_table "game_comments", force: :cascade do |t|
      t.text "comment"
      t.integer "user_id"
      t.integer "game_id"
      t.float "star"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "title"
      t.float "rate"
    end
  end
end
