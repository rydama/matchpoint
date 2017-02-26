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

ActiveRecord::Schema.define(version: 20170226211832) do

  create_table "matches", force: :cascade do |t|
    t.datetime "start_at"
    t.integer  "tournament_id"
    t.integer  "home_player_id"
    t.integer  "away_player_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["away_player_id"], name: "index_matches_on_away_player_id"
    t.index ["home_player_id"], name: "index_matches_on_home_player_id"
    t.index ["tournament_id"], name: "index_matches_on_tournament_id"
  end

  create_table "registrations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tournament_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["tournament_id"], name: "index_registrations_on_tournament_id"
    t.index ["user_id"], name: "index_registrations_on_user_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description", null: false
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "owner_id"
    t.index ["name"], name: "index_tournaments_on_name"
    t.index ["owner_id"], name: "index_tournaments_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

end
