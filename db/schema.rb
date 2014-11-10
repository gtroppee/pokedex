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

ActiveRecord::Schema.define(version: 20141110112146) do

  create_table "pokemons", force: true do |t|
    t.text     "data"
    t.string   "avatar"
    t.integer  "pkdx_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vote_count"
    t.string   "latitude"
    t.string   "longitude"
  end

  create_table "votes", force: true do |t|
    t.integer  "pokemon_id"
    t.string   "ip_address"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["pokemon_id"], name: "index_votes_on_pokemon_id"

end
