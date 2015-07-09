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

ActiveRecord::Schema.define(version: 20150709084409) do

  create_table "cfror_booleans", force: :cascade do |t|
    t.integer "field_id"
    t.string  "dataable_type"
    t.integer "dataable_id"
    t.boolean "body"
  end

  add_index "cfror_booleans", ["dataable_id"], name: "index_cfror_booleans_on_dataable_id"
  add_index "cfror_booleans", ["dataable_type", "dataable_id"], name: "index_cfror_booleans_on_dataable_type_and_dataable_id"
  add_index "cfror_booleans", ["dataable_type"], name: "index_cfror_booleans_on_dataable_type"
  add_index "cfror_booleans", ["field_id"], name: "index_cfror_booleans_on_field_id"

  create_table "cfror_dates", force: :cascade do |t|
    t.integer "field_id"
    t.string  "dataable_type"
    t.integer "dataable_id"
    t.date    "body"
  end

  add_index "cfror_dates", ["dataable_id"], name: "index_cfror_dates_on_dataable_id"
  add_index "cfror_dates", ["dataable_type", "dataable_id"], name: "index_cfror_dates_on_dataable_type_and_dataable_id"
  add_index "cfror_dates", ["dataable_type"], name: "index_cfror_dates_on_dataable_type"
  add_index "cfror_dates", ["field_id"], name: "index_cfror_dates_on_field_id"

  create_table "cfror_datetimes", force: :cascade do |t|
    t.integer  "field_id"
    t.string   "dataable_type"
    t.integer  "dataable_id"
    t.datetime "body"
  end

  add_index "cfror_datetimes", ["dataable_id"], name: "index_cfror_datetimes_on_dataable_id"
  add_index "cfror_datetimes", ["dataable_type", "dataable_id"], name: "index_cfror_datetimes_on_dataable_type_and_dataable_id"
  add_index "cfror_datetimes", ["dataable_type"], name: "index_cfror_datetimes_on_dataable_type"
  add_index "cfror_datetimes", ["field_id"], name: "index_cfror_datetimes_on_field_id"

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

  create_table "cfror_integers", force: :cascade do |t|
    t.integer "field_id"
    t.string  "dataable_type"
    t.integer "dataable_id"
    t.integer "body"
  end

  add_index "cfror_integers", ["dataable_id"], name: "index_cfror_integers_on_dataable_id"
  add_index "cfror_integers", ["dataable_type", "dataable_id"], name: "index_cfror_integers_on_dataable_type_and_dataable_id"
  add_index "cfror_integers", ["dataable_type"], name: "index_cfror_integers_on_dataable_type"
  add_index "cfror_integers", ["field_id"], name: "index_cfror_integers_on_field_id"

  create_table "cfror_options", force: :cascade do |t|
    t.integer "field_id"
    t.string  "dataable_type"
    t.integer "dataable_id"
    t.integer "select_option_id"
  end

  add_index "cfror_options", ["dataable_id"], name: "index_cfror_options_on_dataable_id"
  add_index "cfror_options", ["dataable_type", "dataable_id"], name: "index_cfror_options_on_dataable_type_and_dataable_id"
  add_index "cfror_options", ["dataable_type"], name: "index_cfror_options_on_dataable_type"
  add_index "cfror_options", ["field_id"], name: "index_cfror_options_on_field_id"

  create_table "cfror_select_options", force: :cascade do |t|
    t.integer "field_id"
    t.string  "dataable_type"
    t.integer "dataable_id"
    t.string  "body"
  end

  add_index "cfror_select_options", ["dataable_id"], name: "index_cfror_select_options_on_dataable_id"
  add_index "cfror_select_options", ["dataable_type", "dataable_id"], name: "index_cfror_select_options_on_dataable_type_and_dataable_id"
  add_index "cfror_select_options", ["dataable_type"], name: "index_cfror_select_options_on_dataable_type"
  add_index "cfror_select_options", ["field_id"], name: "index_cfror_select_options_on_field_id"

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
