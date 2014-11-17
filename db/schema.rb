# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141117121513) do

  create_table "pokemon_teams", force: true do |t|
    t.integer  "team_id"
    t.integer  "pokemon_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pokemon_teams", ["pokemon_id"], name: "index_pokemon_teams_on_pokemon_id"
  add_index "pokemon_teams", ["team_id"], name: "index_pokemon_teams_on_team_id"

  create_table "pokemons", force: true do |t|
    t.text     "data"
    t.string   "avatar"
    t.integer  "pkdx_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vote_count"
    t.text     "description"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "reports", force: true do |t|
    t.integer  "pokemon_id"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reports", ["pokemon_id"], name: "index_reports_on_pokemon_id"

  create_table "teams", force: true do |t|
    t.string   "type_team"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "teams", ["user_id"], name: "index_teams_on_user_id"

  create_table "user_pokemons", force: true do |t|
    t.integer  "user_id"
    t.integer  "pokemon_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "type_team"
    t.integer  "attack"
    t.integer  "defense"
  end

  add_index "user_pokemons", ["pokemon_id"], name: "index_user_pokemons_on_pokemon_id"
  add_index "user_pokemons", ["user_id"], name: "index_user_pokemons_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "age"
    t.text     "bio"
    t.boolean  "gender"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "votes", force: true do |t|
    t.integer  "pokemon_id"
    t.string   "ip_address"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["pokemon_id"], name: "index_votes_on_pokemon_id"

end
