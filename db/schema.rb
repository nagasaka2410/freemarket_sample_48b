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

ActiveRecord::Schema.define(version: 20190625134949) do

  create_table "creditcards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",        null: false
    t.string   "account_holder", null: false
    t.string   "card_number",    null: false
    t.integer  "valid_month",    null: false
    t.integer  "valid_year",     null: false
    t.string   "security_code",  null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_creditcards_on_user_id", using: :btree
  end

  create_table "prefectures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "prefecture", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",       null: false
    t.integer  "postal_code",   null: false
    t.string   "city",          null: false
    t.string   "block_number",  null: false
    t.string   "building"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "telephone"
    t.integer  "prefecture_id"
    t.index ["prefecture_id"], name: "index_user_addresses_on_prefecture_id", using: :btree
    t.index ["user_id"], name: "index_user_addresses_on_user_id", using: :btree
  end

  create_table "user_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",         null: false
    t.string   "last_name",       null: false
    t.string   "first_name",      null: false
    t.string   "last_name_kana",  null: false
    t.string   "first_name_kana", null: false
    t.integer  "birth_year",      null: false
    t.integer  "birth_month",     null: false
    t.integer  "birth_day",       null: false
    t.string   "mobile_phone",    null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["user_id"], name: "index_user_details_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "nickname",                            null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "creditcards", "users"
  add_foreign_key "user_addresses", "prefectures"
  add_foreign_key "user_addresses", "users"
  add_foreign_key "user_details", "users"
end
