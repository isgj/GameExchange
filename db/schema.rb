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

ActiveRecord::Schema.define(version: 20171127101303) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_infos", force: :cascade do |t|
    t.integer "api_id"
    t.string "name"
    t.string "url"
    t.text "summary"
    t.integer "platforms", array: true
    t.date "release_date"
    t.string "cover"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_id"], name: "index_game_infos_on_api_id", unique: true
  end

  create_table "games", force: :cascade do |t|
    t.bigint "game_info_id", null: false
    t.bigint "owner_id", null: false
    t.bigint "holder_id", null: false
    t.bigint "platform_id"
    t.integer "state"
    t.date "expire"
    t.date "start_holding"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_info_id"], name: "index_games_on_game_info_id"
    t.index ["holder_id"], name: "index_games_on_holder_id"
    t.index ["owner_id"], name: "index_games_on_owner_id"
    t.index ["platform_id"], name: "index_games_on_platform_id"
  end

  create_table "platforms", force: :cascade do |t|
    t.integer "api_id"
    t.string "name"
    t.string "photo"
    t.string "url"
    t.integer "generation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_id"], name: "index_platforms_on_api_id", unique: true
  end

  create_table "queries", force: :cascade do |t|
    t.string "query"
    t.integer "games", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["query"], name: "index_queries_on_query", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "provider"
    t.string "uid"
    t.string "photo"
    t.string "city"
    t.bigint "phone"
    t.integer "points", default: 0
    t.integer "votes", default: 0
    t.float "avg_vote", default: 0.0
    t.boolean "visibility", default: true
    t.integer "age"
    t.string "gender", limit: 1
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "games", "game_infos"
  add_foreign_key "games", "platforms"
  add_foreign_key "games", "users", column: "holder_id"
  add_foreign_key "games", "users", column: "owner_id"
end
