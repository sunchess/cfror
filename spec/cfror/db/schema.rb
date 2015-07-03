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

ActiveRecord::Schema.define(version: 20150703130107) do

  create_table "cfror_fields", force: :cascade do |t|
    t.string  "fieldable_type"
    t.integer "fieldable_id"
    t.string  "field_type"
    t.string  "title"
    t.string  "name"
  end

  add_index "cfror_fields", ["fieldable_id"], name: "index_cfror_fields_on_fieldable_id"
  add_index "cfror_fields", ["fieldable_type", "fieldable_id"], name: "index_cfror_fields_on_fieldable_type_and_fieldable_id"
  add_index "cfror_fields", ["fieldable_type"], name: "index_cfror_fields_on_fieldable_type"

  create_table "cfror_strings", force: :cascade do |t|
    t.integer "field_id"
    t.string  "body"
  end

  add_index "cfror_strings", ["field_id"], name: "index_cfror_strings_on_field_id"

  create_table "cfror_texts", force: :cascade do |t|
    t.integer "field_id"
    t.text    "body"
  end

  add_index "cfror_texts", ["field_id"], name: "index_cfror_texts_on_field_id"

end
