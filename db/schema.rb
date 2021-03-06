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

ActiveRecord::Schema.define(version: 20140626015021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: true do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "url"
    t.string   "mission"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest", null: false
    t.string   "salt",            null: false
  end

  create_table "product_promotions", force: true do |t|
    t.integer  "promoter_id",          null: false
    t.integer  "promoting_product_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "product_promotions", ["promoter_id", "promoting_product_id"], name: "index_promoter_and_promoting_product_on_promotion", unique: true, using: :btree
  add_index "product_promotions", ["promoter_id"], name: "index_product_promotions_on_promoter_id", using: :btree
  add_index "product_promotions", ["promoting_product_id"], name: "index_product_promotions_on_promoting_product_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "name",               null: false
    t.integer  "requirement",        null: false
    t.string   "reward",             null: false
    t.string   "description"
    t.integer  "company_id",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "products", ["company_id"], name: "index_products_on_company_id", using: :btree

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

end
