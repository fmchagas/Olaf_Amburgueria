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

ActiveRecord::Schema.define(version: 2020_02_06_004823) do

  create_table "administrators", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "phone"
    t.string "email"
    t.string "address"
    t.string "number"
    t.string "district"
    t.string "zip"
    t.string "city"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.float "price"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id"
    t.float "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "quantity"
    t.integer "tipe_product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "price"
    t.string "image"
    t.index ["tipe_product_id"], name: "index_products_on_tipe_product_id"
  end

  create_table "tipe_products", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
