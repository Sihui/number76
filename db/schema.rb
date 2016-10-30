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

ActiveRecord::Schema.define(version: 20161030173255) do

  create_table "electricity_rates", force: :cascade do |t|
    t.datetime "date",       default: '2016-10-30 22:48:19', null: false
    t.decimal  "rate",       default: "0.0",                 null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "receipt_id"
    t.index ["receipt_id"], name: "electricity_rate_index_receipt_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.datetime "date",       default: '2016-10-30 22:48:19', null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "records", force: :cascade do |t|
    t.datetime "date",                default: '2016-10-30 22:48:19', null: false
    t.decimal  "pre_water_count",     default: "0.0",                 null: false
    t.decimal  "current_water_count", default: "0.0",                 null: false
    t.decimal  "pre_ele_count",       default: "0.0",                 null: false
    t.decimal  "current_ele_count",   default: "0.0",                 null: false
    t.decimal  "internet_fee",        default: "0.0",                 null: false
    t.decimal  "tv_fee",              default: "0.0",                 null: false
    t.decimal  "cleaning_fee",        default: "0.0",                 null: false
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.integer  "room_id",             default: 0,                     null: false
    t.integer  "tenant_id",           default: 0,                     null: false
    t.integer  "receipt_id"
    t.index ["receipt_id"], name: "index_receipt_id"
    t.index ["room_id"], name: "index_records_on_room_id"
    t.index ["tenant_id"], name: "index_records_on_tenant_id"
  end

  create_table "room_tenant_connections", force: :cascade do |t|
    t.integer  "room_id",    default: 0,     null: false
    t.integer  "tenant_id"
    t.boolean  "active",     default: false, null: false
    t.boolean  "is_admin",   default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "number",     default: "0",   null: false
    t.decimal  "rent",       default: "0.0", null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "tenants", force: :cascade do |t|
    t.string   "name",       default: "张三", null: false
    t.string   "phone"
    t.string   "gov_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "water_rates", force: :cascade do |t|
    t.datetime "date",       default: '2016-10-30 22:48:19', null: false
    t.decimal  "rate",       default: "0.0",                 null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "receipt_id"
    t.index ["receipt_id"], name: "water_rate_index_receipt_id"
  end

end
