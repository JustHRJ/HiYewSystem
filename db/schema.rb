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

ActiveRecord::Schema.define(version: 20170113115050) do

  create_table "costs", force: :cascade do |t|
    t.string   "description"
    t.float    "cost"
    t.integer  "project_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "costs", ["project_id"], name: "index_costs_on_project_id"

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "postal_code"
    t.string   "contact_number"
    t.float    "limit"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "name"
    t.string   "picture"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture2"
    t.string   "picture3"
    t.string   "picture4"
    t.string   "picture5"
  end

  add_index "images", ["project_id"], name: "index_images_on_project_id"

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

  create_table "payments", force: :cascade do |t|
    t.string   "invoice_no"
    t.float    "amount"
    t.integer  "customer_id"
    t.date     "payment_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "project_logs", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "details"
    t.string   "heading"
    t.integer  "project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "project_complete", default: false
    t.datetime "completed_time"
    t.integer  "customer_id"
  end

end
