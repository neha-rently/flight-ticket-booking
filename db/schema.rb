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

ActiveRecord::Schema.define(version: 2022_05_26_060039) do

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
    t.float "economy", null: false
    t.float "business", null: false
  end

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer "resource_owner_id"
    t.integer "application_id", null: false
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.string "previous_refresh_token", default: "", null: false
    t.index ["application_id"], name: "index_oauth_access_tokens_on_application_id"
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "oauth_applications", force: :cascade do |t|
    t.string "name", null: false
    t.string "uid", null: false
    t.string "secret", null: false
    t.text "redirect_uri"
    t.string "scopes", default: "", null: false
    t.boolean "confidential", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true
  end

  create_table "passengers", force: :cascade do |t|
    t.string "name", null: false
    t.integer "age", null: false
    t.string "email", null: false
    t.string "contact", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "users_id", null: false
    t.index ["contact"], name: "index_passengers_on_contact", unique: true
    t.index ["email", "contact"], name: "index_passengers_on_email_and_contact", unique: true
    t.index ["email"], name: "index_passengers_on_email", unique: true
    t.index ["users_id"], name: "index_passengers_on_users_id"
  end

  create_table "pnr_histories", force: :cascade do |t|
    t.bigint "pnr_id", null: false
    t.bigint "ticket_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pnr_id"], name: "index_pnr_histories_on_pnr_id"
    t.index ["ticket_id"], name: "index_pnr_histories_on_ticket_id"
  end

  create_table "pnrs", force: :cascade do |t|
    t.date "booking_date", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "count", null: false
    t.index ["user_id"], name: "index_pnrs_on_user_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "checkin_status"
    t.string "luggage"
    t.string "food"
    t.bigint "passenger_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "flights_id"
    t.bigint "users_id", null: false
    t.float "cost"
    t.string "seat_class"
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

  add_foreign_key "oauth_access_tokens", "oauth_applications", column: "application_id"
  add_foreign_key "passengers", "users", column: "users_id"
  add_foreign_key "pnr_histories", "pnrs"
  add_foreign_key "pnr_histories", "tickets"
  add_foreign_key "pnrs", "users"
  add_foreign_key "tickets", "flights", column: "flights_id"
  add_foreign_key "tickets", "passengers"
  add_foreign_key "tickets", "users", column: "users_id"
end
