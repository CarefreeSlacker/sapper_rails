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

ActiveRecord::Schema.define(version: 20160114073609) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cells", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "x"
    t.integer  "y"
    t.integer  "value",       default: 0
    t.boolean  "open",        default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "wave_number"
  end

  add_index "cells", ["game_id"], name: "index_cells_on_game_id", using: :btree
  add_index "cells", ["x"], name: "index_cells_on_x", using: :btree
  add_index "cells", ["y"], name: "index_cells_on_y", using: :btree

  create_table "games", force: :cascade do |t|
    t.string   "username"
    t.integer  "bombs_count"
    t.integer  "fields_height"
    t.integer  "fields_width"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.boolean  "lost"
  end

end
