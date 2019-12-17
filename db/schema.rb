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

ActiveRecord::Schema.define(version: 20191216083344) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "post_number",   null: false
    t.integer  "prefecture_id", null: false
    t.string   "city",          null: false
    t.string   "town",          null: false
    t.string   "building"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "authorizations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid"], name: "index_authorizations_on_provider_and_uid", unique: true, using: :btree
  end

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brands_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "category_id", null: false
    t.integer  "brand_id",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["brand_id"], name: "index_brands_categories_on_brand_id", using: :btree
    t.index ["category_id"], name: "index_brands_categories_on_category_id", using: :btree
  end

  create_table "cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "customer_id"
    t.string   "card_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_cards_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry", using: :btree
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "src",        null: false
    t.integer  "item_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_images_on_item_id", using: :btree
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                      null: false
    t.text     "item_text",       limit: 65535
    t.integer  "price",                                     null: false
    t.integer  "condition",                                 null: false
    t.integer  "delivery_fee",                              null: false
    t.integer  "delivery_method"
    t.integer  "days",                                      null: false
    t.integer  "prefecture_id",                             null: false
    t.integer  "status",                        default: 1, null: false
    t.integer  "size"
    t.integer  "fee",                                       null: false
    t.integer  "profit",                                    null: false
    t.integer  "user_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "category_id"
    t.integer  "brand_id"
    t.integer  "buyer_id"
    t.index ["brand_id"], name: "index_items_on_brand_id", using: :btree
    t.index ["buyer_id"], name: "index_items_on_buyer_id", using: :btree
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
    t.index ["name"], name: "index_items_on_name", using: :btree
    t.index ["user_id"], name: "index_items_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nickname",                                          null: false
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "avatar"
    t.text     "user_text",              limit: 65535
    t.string   "first_name",                                        null: false
    t.string   "last_name",                                         null: false
    t.string   "first_name_kana",                                   null: false
    t.string   "last_name_kana",                                    null: false
    t.date     "birthday",                                          null: false
    t.boolean  "agreement"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string   "phone_number",                                      null: false
    t.datetime "remember_created_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "uid"
    t.string   "provider"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "brands_categories", "brands"
  add_foreign_key "brands_categories", "categories"
  add_foreign_key "cards", "users"
  add_foreign_key "images", "items"
  add_foreign_key "items", "brands"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "users"
  add_foreign_key "items", "users", column: "buyer_id"
end
