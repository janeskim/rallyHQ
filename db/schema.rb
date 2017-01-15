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

ActiveRecord::Schema.define(version: 20170115012402) do

  create_table "bills", force: :cascade do |t|
    t.string   "vote_id"
    t.string   "short_title"
    t.string   "api_id"
    t.string   "type"
    t.string   "number"
    t.string   "chamber"
    t.string   "result"
    t.string   "debate_chamber"
    t.date     "introduced_on"
    t.date     "last_action_at"
    t.date     "debate_at"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "committee_bills", force: :cascade do |t|
    t.integer "committee_id", null: false
    t.integer "bill_id",      null: false
  end

  add_index "committee_bills", ["committee_id", "bill_id"], name: "index_committee_bills_on_committee_id_and_bill_id", unique: true

  create_table "committees", force: :cascade do |t|
    t.string   "api_id"
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "legislator_bills", force: :cascade do |t|
    t.integer "legislator_id", null: false
    t.integer "bill_id",       null: false
  end

  add_index "legislator_bills", ["legislator_id", "bill_id"], name: "index_legislator_bills_on_legislator_id_and_bill_id", unique: true

  create_table "legislators", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "party"
    t.string   "title"
    t.string   "state"
    t.string   "chamber"
    t.string   "phone"
    t.string   "website"
    t.string   "address"
    t.string   "bioguide_id"
    t.string   "govtrack_id"
    t.string   "thomas_id"
    t.boolean  "in_office"
    t.datetime "term_start"
    t.datetime "term_end"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "votes", force: :cascade do |t|
    t.string   "type"
    t.string   "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
