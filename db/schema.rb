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

ActiveRecord::Schema.define(version: 2019_12_07_215936) do

  create_table "conferencerooms", force: :cascade do |t|
    t.string "conferenceroomname", null: false
    t.integer "people", null: false
    t.integer "price", null: false
    t.datetime "start_date", null: false
    t.datetime "end_date", null: false
    t.text "remarks"
    t.integer "facility_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facility_id"], name: "index_conferencerooms_on_facility_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "start_date", null: false
    t.datetime "end_date", null: false
    t.string "title", null: false
    t.text "content", null: false
    t.integer "user_id", null: false
    t.integer "conferenceroom_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conferenceroom_id"], name: "index_events_on_conferenceroom_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name", default: "", null: false
    t.string "first_name", default: "", null: false
    t.integer "facility_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["facility_id"], name: "index_users_on_facility_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
