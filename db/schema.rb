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

ActiveRecord::Schema.define(version: 20141031195704) do

  create_table "characters", force: true do |t|
    t.string   "name"
    t.integer  "level",       default: 1
    t.integer  "xp",          default: 0
    t.integer  "gold",        default: 0
    t.integer  "race_id"
    t.integer  "pc_class_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "game_settings", force: true do |t|
    t.integer  "max_level"
    t.string   "level_formula"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pc_classes", force: true do |t|
    t.string   "name"
    t.integer  "str_gain"
    t.integer  "dex_gain"
    t.integer  "vit_gain"
    t.integer  "int_gain"
    t.integer  "wis_gain"
    t.integer  "spd_gain"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "races", force: true do |t|
    t.string   "name"
    t.integer  "str_gain"
    t.integer  "dex_gain"
    t.integer  "vit_gain"
    t.integer  "int_gain"
    t.integer  "wis_gain"
    t.integer  "spd_gain"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_securities", force: true do |t|
    t.string   "account_level", limit: 1, default: "G"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.integer  "user_security_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
