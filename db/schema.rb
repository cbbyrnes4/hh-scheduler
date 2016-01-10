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

ActiveRecord::Schema.define(version: 20160109221150) do

  create_table "appointments", force: :cascade do |t|
    t.string   "customer_first_name", limit: 64,                    null: false
    t.string   "customer_last_name",  limit: 64,                    null: false
    t.string   "street_address",                                    null: false
    t.string   "city",                                              null: false
    t.string   "state",                                             null: false
    t.string   "zip",                                               null: false
    t.string   "type",                           default: "Local"
    t.string   "status",                         default: "active"
    t.integer  "job_size"
    t.integer  "estimated_time"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.boolean  "visibility",                     default: true
    t.integer  "current_size",                   default: 0
    t.integer  "actual_time"
    t.text     "notes"
    t.string   "email"
    t.string   "phone_number"
    t.datetime "datetime"
  end

  create_table "appointments_employees", id: false, force: :cascade do |t|
    t.integer "employee_id",    null: false
    t.integer "appointment_id", null: false
  end

  add_index "appointments_employees", ["appointment_id", "employee_id"], name: "index_appointments_employees_on_appointment_id_and_employee_id"

  create_table "employees", force: :cascade do |t|
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "username",   limit: 24
  end

  create_table "users", force: :cascade do |t|
    t.string   "type",                    default: "User"
    t.string   "first_name",   limit: 64,                         null: false
    t.string   "last_name",    limit: 64,                         null: false
    t.string   "password",     limit: 30
    t.string   "email",                                           null: false
    t.string   "phone_number"
    t.string   "status",                  default: "unconfirmed"
    t.string   "wage"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

end
