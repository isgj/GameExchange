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

ActiveRecord::Schema.define(version: 20171207080516) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendships", force: :cascade do |t|
    t.integer "friender_id"
    t.integer "friended_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friended_id"], name: "index_friendships_on_friended_id"
    t.index ["friender_id", "friended_id"], name: "index_friendships_on_friender_id_and_friended_id", unique: true
    t.index ["friender_id"], name: "index_friendships_on_friender_id"
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

end
