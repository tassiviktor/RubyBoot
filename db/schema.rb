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

ActiveRecord::Schema.define(version: 20180508141044) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", id: :serial, force: :cascade do |t|
    t.string "key"
    t.text "ip_whitelist"
    t.text "ip_blacklist"
    t.boolean "is_master_key", default: false
    t.string "key_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_api_keys_on_key", unique: true
  end

  create_table "api_keys_apiv2_realms", id: false, force: :cascade do |t|
    t.bigint "api_key_id", null: false
    t.bigint "realm_id", null: false
    t.index ["api_key_id"], name: "index_api_keys_apiv2_realms_on_api_key_id"
    t.index ["realm_id"], name: "index_api_keys_apiv2_realms_on_realm_id"
  end

  create_table "apiv2_realms", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "apiv2_users", force: :cascade do |t|
    t.bigint "realm_id", null: false
    t.boolean "admin", default: false, null: false
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_hash"
    t.string "password_reset_token"
    t.datetime "reset_password_sent_at"
    t.datetime "confirmation_sent_at"
    t.string "confirmation_token"
    t.string "nickname"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["realm_id"], name: "index_apiv2_users_on_realm_id"
  end

  add_foreign_key "api_keys_apiv2_realms", "api_keys"
  add_foreign_key "api_keys_apiv2_realms", "apiv2_realms", column: "realm_id"
  add_foreign_key "apiv2_users", "apiv2_realms", column: "realm_id"
end
