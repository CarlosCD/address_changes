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

ActiveRecord::Schema.define(version: 20180119000651) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "devices", force: :cascade do |t|
    t.string   "serial_number", null: false
    t.string   "firmware",      null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "devices", ["serial_number"], name: "index_devices_on_serial_number", unique: true, using: :btree

  create_table "sensor_data", force: :cascade do |t|
    t.decimal  "temperature",   precision: 5, scale: 2
    t.decimal  "air_humidity",  precision: 5, scale: 2
    t.integer  "co_level"
    t.string   "device_health"
    t.boolean  "co_alert",                              default: false, null: false
    t.integer  "device_id"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  add_index "sensor_data", ["device_id"], name: "index_sensor_data_on_device_id", using: :btree

  add_foreign_key "sensor_data", "devices"
end
