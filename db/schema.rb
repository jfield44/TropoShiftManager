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

ActiveRecord::Schema.define(version: 20160206230356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "absence_blasters", force: :cascade do |t|
    t.string   "recipient_name"
    t.string   "recipient_number"
    t.string   "shift"
    t.string   "access_code"
    t.integer  "absense_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "absence_blasters", ["absense_id"], name: "index_absence_blasters_on_absense_id", using: :btree

  create_table "absenses", force: :cascade do |t|
    t.string   "shift"
    t.string   "reason"
    t.string   "replacement_employee"
    t.integer  "employee_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "phone_number"
  end

  add_index "absenses", ["employee_id"], name: "index_absenses_on_employee_id", using: :btree

  create_table "employees", force: :cascade do |t|
    t.string   "employee_number"
    t.string   "first_name"
    t.string   "surname"
    t.string   "security_pin"
    t.string   "mobile_number"
    t.string   "monday_shift"
    t.string   "tuesday_shift"
    t.string   "wednesday_shift"
    t.string   "thursday_shift"
    t.string   "friday_shift"
    t.string   "saturday_shift"
    t.string   "sunday_shift"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "absence_blasters", "absenses"
  add_foreign_key "absenses", "employees"
end
