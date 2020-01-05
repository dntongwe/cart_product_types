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

ActiveRecord::Schema.define(version: 2020_01_05_044157) do

  create_table "cart_items", force: :cascade do |t|
    t.integer "product_id"
    t.integer "cart_id"
    t.integer "quantity"
    t.decimal "unit_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "purchased_at"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.text "content"
    t.index ["ancestry"], name: "index_categories_on_ancestry"
  end

  create_table "order_transactions", force: :cascade do |t|
    t.integer "order_id"
    t.string "action"
    t.integer "amount"
    t.boolean "success"
    t.string "authorization"
    t.string "message"
    t.text "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "cart_id"
    t.string "ip_address"
    t.string "first_name"
    t.string "last_name"
    t.string "card_type"
    t.date "card_expires_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_notifications", force: :cascade do |t|
    t.text "params"
    t.integer "cart_id"
    t.string "status"
    t.string "transaction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_fields", force: :cascade do |t|
    t.string "name"
    t.string "field_type"
    t.boolean "required"
    t.integer "product_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_type_id"], name: "index_product_fields_on_product_type_id"
  end

  create_table "product_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.datetime "released_at"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_type_id"
    t.text "properties"
  end

  create_table "searches", force: :cascade do |t|
    t.string "keywords"
    t.integer "category_id"
    t.decimal "min_price"
    t.decimal "max_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
