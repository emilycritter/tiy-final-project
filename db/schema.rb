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

ActiveRecord::Schema.define(version: 20160419212751) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string   "shop_name"
    t.string   "name_parameterize"
    t.string   "photo_id"
    t.text     "bio"
    t.integer  "user_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "location"
    t.string   "city",              default: "Nowhere"
    t.string   "state",             default: "USA"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "piece_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "piece_id"
    t.boolean  "shipped",    default: false
    t.integer  "quantity",   default: 0
    t.decimal  "price",      default: 0.0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "purchased_at"
    t.string   "status",             default: "cart"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "order_confirmation"
  end

  create_table "piece_categories", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "piece_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "pieces", force: :cascade do |t|
    t.string   "title"
    t.float    "price",       default: 0.0
    t.integer  "inventory",   default: 1
    t.text     "description"
    t.string   "photo_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "artist_id"
    t.integer  "view_count",  default: 0
  end

  create_table "refile_attachments", force: :cascade do |t|
    t.string "namespace", null: false
  end

  add_index "refile_attachments", ["namespace"], name: "index_refile_attachments_on_namespace", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "location"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "phone_number"
  end

end
