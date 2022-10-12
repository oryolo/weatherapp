# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_13_121936) do
  create_table "locations", force: :cascade do |t|
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lon", precision: 15, scale: 10
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "postcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lat"], name: "index_locations_on_lat"
    t.index ["lon"], name: "index_locations_on_lon"
  end

  create_table "search_requests", force: :cascade do |t|
    t.string "query"
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_search_requests_on_location_id"
  end

  create_table "weather_forecasts", force: :cascade do |t|
    t.decimal "temp"
    t.decimal "feels_like"
    t.decimal "temp_min"
    t.decimal "temp_max"
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_weather_forecasts_on_location_id"
  end

  create_table "weather_records", force: :cascade do |t|
    t.decimal "temp"
    t.decimal "feels_like"
    t.decimal "temp_min"
    t.decimal "temp_max"
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_weather_records_on_location_id"
  end

  add_foreign_key "search_requests", "locations"
  add_foreign_key "weather_forecasts", "locations"
  add_foreign_key "weather_records", "locations"
end
