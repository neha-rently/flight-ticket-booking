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

ActiveRecord::Schema.define(version: 2022_05_11_110003) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "flights", force: :cascade do |t|
    t.string "flight_no", null: false
    t.date "journey_date", null: false
    t.time "arr_time", null: false
    t.time "dep_time", null: false
    t.string "departing", null: false
    t.string "arriving", null: false
    t.string "flight_status", null: false
    t.integer "seats_available", null: false
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
    t.bigint "users_id", null: false
    t.index ["email", "contact"], name: "index_passengers_on_email_and_contact", unique: true
    t.index ["email"], name: "index_passengers_on_email", unique: true
    t.index ["users_id"], name: "index_passengers_on_users_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "checkin_status"
    t.string "seat_class"
    t.string "seat_no"
    t.string "luggage"
    t.string "food"
    t.bigint "passenger_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "flights_id"
    t.bigint "users_id", null: false
    t.index ["flights_id"], name: "index_tickets_on_flights_id"
    t.index ["passenger_id"], name: "index_tickets_on_passenger_id"
    t.index ["users_id"], name: "index_tickets_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "contact", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "passengers", "users", column: "users_id"
  add_foreign_key "tickets", "flights", column: "flights_id"
  add_foreign_key "tickets", "passengers"
  add_foreign_key "tickets", "users", column: "users_id"
end
