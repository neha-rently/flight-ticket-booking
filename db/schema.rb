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

ActiveRecord::Schema.define(version: 2022_05_06_021005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flights", force: :cascade do |t|
    t.string "flight_no"
    t.date "journey_date"
    t.time "arr_time"
    t.time "dep_time"
    t.string "departing"
    t.string "arriving"
    t.string "flight_status"
    t.integer "seats_available"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "passengers", force: :cascade do |t|
    t.string "name", null: false
    t.integer "age", null: false
    t.string "email", null: false
    t.string "contact", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email", "contact"], name: "index_passengers_on_email_and_contact", unique: true
    t.index ["email"], name: "index_passengers_on_email", unique: true
  end

  create_table "tickets", force: :cascade do |t|
    t.string "checkin_status"
    t.string "seat_class"
    t.string "seat_no"
    t.string "luggage"
    t.string "food"
    t.float "total_cost"
    t.bigint "passenger_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["passenger_id"], name: "index_tickets_on_passenger_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "contact"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact"], name: "index_users_on_contact", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "tickets", "passengers"
end
