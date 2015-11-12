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

ActiveRecord::Schema.define(version: 20151112014023) do

  create_table "categories", force: :cascade do |t|
    t.text     "description", limit: 65535
    t.integer  "product_id",  limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "categories", ["product_id"], name: "index_categories_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "unity",              limit: 255
    t.string   "description",        limit: 255
    t.string   "identification",     limit: 255
    t.float    "cost",               limit: 24
    t.text     "observation",        limit: 65535
    t.string   "provider",           limit: 255
    t.float    "stock",              limit: 24
    t.string   "bar_code",           limit: 255
    t.float    "min_stock",          limit: 24
    t.float    "max_stock",          limit: 24
    t.float    "stock_purchase",     limit: 24
    t.float    "factor",             limit: 24
    t.string   "ncm",                limit: 255
    t.string   "brand",              limit: 255
    t.float    "weight",             limit: 24
    t.float    "size",               limit: 24
    t.boolean  "inactive",           limit: 1
    t.integer  "kind",               limit: 4
    t.string   "composition",        limit: 255
    t.string   "feedstock",          limit: 255
    t.string   "expedient_material", limit: 255
    t.boolean  "for_sale",           limit: 1
    t.string   "currency",           limit: 255
    t.string   "code",               limit: 255
    t.string   "ipi",                limit: 255
    t.string   "gender",             limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "selling_values", force: :cascade do |t|
    t.float    "value",      limit: 24
    t.integer  "product_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "selling_values", ["product_id"], name: "index_selling_values_on_product_id", using: :btree

  add_foreign_key "categories", "products"
  add_foreign_key "selling_values", "products"
end
