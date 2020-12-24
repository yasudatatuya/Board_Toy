# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_20_082640) do

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

  create_table "games", force: :cascade do |t|
    t.integer "genre", default: 0, null: false
    t.string "name"
    t.string "image_id"
    t.string "introduction"
    t.integer "price"
    t.integer "play_timemin"
    t.integer "play_timemax"
    t.integer "number_min"
    t.integer "number_max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "ifchildren", default: false, null: false
    t.boolean "ifeasy", default: false, null: false
    t.boolean "ifhard", default: false, null: false
    t.float "rate"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "topic_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usefuls", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "management_permissions", default: false, null: false
    t.string "profile_image_id"
    t.string "introduction"
    t.string "name"
    t.string "nickname"
    t.string "comment"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
