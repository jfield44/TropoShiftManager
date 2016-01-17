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

ActiveRecord::Schema.define(version: 20160117164840) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

end
