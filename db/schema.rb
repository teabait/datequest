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

ActiveRecord::Schema.define(version: 20131214173905) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: true do |t|
    t.string "description", null: false
    t.string "rank"
  end

  create_table "challenges_dates", force: true do |t|
    t.boolean  "complete",     default: false
    t.integer  "completer_id"
    t.integer  "challenge_id"
    t.integer  "date_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.string   "subject"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quests", force: true do |t|
    t.datetime "date_time",                     null: false
    t.string   "location"
    t.integer  "date_creator",                  null: false
    t.integer  "date_acceptor",                 null: false
    t.boolean  "accepted",      default: false
    t.string   "description",                   null: false
  end

  create_table "users", force: true do |t|
    t.string   "username",                    null: false
    t.string   "email",                       null: false
    t.string   "password_digest",             null: false
    t.string   "location",                    null: false
    t.string   "rank"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
    t.string   "blurb"
    t.string   "phone",           limit: nil
    t.date     "birthdate"
  end

end
