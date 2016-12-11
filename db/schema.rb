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

ActiveRecord::Schema.define(version: 20161210150717) do

  create_table "metal_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "metal_composites", force: :cascade do |t|
    t.float    "iron"
    t.float    "calcium"
    t.float    "potassium"
    t.float    "others"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "metal_metal_categories", force: :cascade do |t|
    t.integer "metal_id"
    t.integer "metal_category_id"
  end

  create_table "metal_metals", force: :cascade do |t|
    t.integer "metal_associator_id"
    t.integer "metal_associating_id"
  end

  create_table "metals", force: :cascade do |t|
    t.string   "name"
    t.string   "metal_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "metal_composite_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end