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

ActiveRecord::Schema.define(version: 20151109011101) do

  create_table "categories", force: :cascade do |t|
    t.text     "description", limit: 65535
    t.integer  "product_id",  limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "categories", ["product_id"], name: "index_categories_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.text     "unity",              limit: 65535
    t.text     "description",        limit: 65535
    t.text     "identification",     limit: 65535
    t.float    "cost",               limit: 24
    t.text     "observation",        limit: 65535
    t.text     "provider",           limit: 65535
    t.float    "stock",              limit: 24
    t.text     "bar_code",           limit: 65535
    t.float    "min_stock",          limit: 24
    t.float    "max_stock",          limit: 24
    t.float    "stock_purchase",     limit: 24
    t.float    "factor",             limit: 24
    t.text     "ncm",                limit: 65535
    t.text     "brand",              limit: 65535
    t.float    "weight",             limit: 24
    t.float    "size",               limit: 24
    t.boolean  "inactive",           limit: 1
    t.integer  "type",               limit: 4
    t.text     "composition",        limit: 65535
    t.text     "feedstock",          limit: 65535
    t.text     "expedient_material", limit: 65535
    t.boolean  "for_sale",           limit: 1
    t.text     "currency",           limit: 65535
    t.text     "code",               limit: 65535
    t.text     "ipi",                limit: 65535
    t.text     "gender",             limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_foreign_key "categories", "products"
end
