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

ActiveRecord::Schema.define(version: 20150828145347) do

  create_table "administrators", force: true do |t|
    t.string   "email",                           null: false
    t.string   "email_for_index",                 null: false
    t.string   "admin_name",                      null: false
    t.string   "hashed_password",                 null: false
    t.date     "start_date",                      null: false
    t.date     "end_date"
    t.boolean  "suspended",       default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "administrators", ["admin_name"], name: "index_administrators_on_admin_name"
  add_index "administrators", ["email_for_index"], name: "index_administrators_on_email_for_index", unique: true

  create_table "staff_events", force: true do |t|
    t.integer  "staff_member_id", null: false
    t.string   "type",            null: false
    t.datetime "created_at",      null: false
  end

  add_index "staff_events", ["created_at"], name: "index_staff_events_on_created_at"
  add_index "staff_events", ["staff_member_id", "created_at"], name: "index_staff_events_on_staff_member_id_and_created_at"

  create_table "staff_members", force: true do |t|
    t.string   "email",                                 null: false
    t.string   "email_for_index",                       null: false
    t.string   "family_name",                           null: false
    t.string   "given_name",                            null: false
    t.string   "family_name_eng",                       null: false
    t.string   "given_name_eng",                        null: false
    t.string   "staff_user_name",                       null: false
    t.string   "staff_user_name_index",                 null: false
    t.string   "hashed_password",                       null: false
    t.date     "start_date",                            null: false
    t.date     "end_date"
    t.boolean  "suspended",             default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "staff_members", ["email_for_index"], name: "index_staff_members_on_email_for_index", unique: true
  add_index "staff_members", ["family_name_eng", "given_name_eng"], name: "index_staff_members_on_family_name_eng_and_given_name_eng"
  add_index "staff_members", ["staff_user_name_index"], name: "index_staff_members_on_staff_user_name_index"

end
