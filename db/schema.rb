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

ActiveRecord::Schema.define(version: 20160908192545) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string  "activity"
    t.integer "strava_id"
    t.float   "mileage"
    t.integer "client_id"
    t.integer "bike_id"
  end

  create_table "bikes", force: :cascade do |t|
    t.string   "name"
    t.string   "serial_number"
    t.string   "model"
    t.string   "brand"
    t.integer  "client_id"
    t.date     "bought_on"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "parts", force: :cascade do |t|
    t.string   "part_type"
    t.string   "description"
    t.string   "serial_number"
    t.integer  "bike_id"
    t.date     "mounted_on"
    t.date     "purchased_on"
    t.float    "distance_in_km",          default: 0.0
    t.float    "expected_lifetime_in_km", default: 750.0
    t.boolean  "is_expired",              default: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.boolean  "email_sent",              default: false
  end

end
