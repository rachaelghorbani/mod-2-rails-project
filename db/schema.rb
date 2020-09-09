# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_09_150440) do

  create_table "courts", force: :cascade do |t|
    t.text "prop_id"
    t.string "name"
    t.text "location"
    t.text "phone"
    t.integer "number_of_courts"
    t.string "indoor_outdoor"
    t.string "court_type"
    t.text "info"
    t.decimal "latitude"
    t.decimal "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followee_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "name"
    t.integer "age"
    t.float "level"
    t.string "address"
    t.string "profile_picture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "email"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "court_id", null: false
    t.datetime "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["court_id"], name: "index_reservations_on_court_id"
    t.index ["player_id"], name: "index_reservations_on_player_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "player_id"
    t.integer "court_id"
    t.text "review"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "rating"
  end

  add_foreign_key "reservations", "courts"
  add_foreign_key "reservations", "players"
end
