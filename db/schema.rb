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

ActiveRecord::Schema.define(version: 20150209052428) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adventures", force: :cascade do |t|
    t.string   "offer_type"
    t.string   "adventure_type"
    t.text     "image"
    t.text     "pickup_location"
    t.text     "activity_location"
    t.text     "description"
    t.integer  "seats"
    t.string   "difficulty"
    t.string   "gender_preference"
    t.string   "sponsor_company"
    t.text     "extras"
    t.integer  "age_limit"
    t.text     "duration"
    t.string   "overnight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.integer  "user_id"
    t.datetime "checkin"
    t.datetime "checkout"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "adventure_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "checkin"
    t.datetime "checkout"
    t.string   "accepted"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "dob"
    t.string   "email"
    t.text     "password_digest"
    t.integer  "phone"
    t.string   "gender"
    t.text     "description"
    t.boolean  "smoker"
    t.text     "interests"
    t.boolean  "car"
    t.string   "car_type"
    t.integer  "car_year"
    t.string   "car_model"
    t.text     "image"
    t.string   "occupation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",        default: false
  end

end
