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

ActiveRecord::Schema.define(version: 20160420204540) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "door_mat_access_tokens", force: :cascade do |t|
    t.integer  "actor_id"
    t.text     "hashed_token", default: "", null: false
    t.text     "name",         default: "", null: false
    t.integer  "token_for",    default: 0
    t.integer  "status",       default: 0
    t.text     "identifier",   default: "", null: false
    t.text     "data",         default: "", null: false
    t.integer  "reference_id", default: 0,  null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "rating",       default: 0
  end

  add_index "door_mat_access_tokens", ["hashed_token"], name: "index_door_mat_access_tokens_on_hashed_token", using: :btree

  create_table "door_mat_activities", force: :cascade do |t|
    t.integer  "actor_id"
    t.string   "type",          default: "", null: false
    t.integer  "notifier_id",                null: false
    t.string   "notifier_type", default: "", null: false
    t.text     "link_hash",     default: "", null: false
    t.integer  "status",        default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "door_mat_activities", ["actor_id"], name: "index_door_mat_activities_on_actor_id", using: :btree

  create_table "door_mat_actors", force: :cascade do |t|
    t.text     "key_salt",           default: "", null: false
    t.text     "password_salt",      default: "", null: false
    t.text     "password_hash",      default: "", null: false
    t.text     "system_key",         default: "", null: false
    t.text     "recovery_key",       default: "", null: false
    t.text     "encrypted_pem_key",  default: "", null: false
    t.text     "pem_encrypted_pkey", default: "", null: false
    t.text     "pem_public_key",     default: "", null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "door_mat_emails", force: :cascade do |t|
    t.integer  "actor_id"
    t.text     "address_hash", default: "", null: false
    t.text     "address",      default: "", null: false
    t.integer  "status",       default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "door_mat_emails", ["actor_id"], name: "index_door_mat_emails_on_actor_id", using: :btree
  add_index "door_mat_emails", ["address_hash"], name: "index_door_mat_emails_on_address_hash", using: :btree

  create_table "door_mat_memberships", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "member_of_id"
    t.integer  "sponsor",      default: 0
    t.integer  "owner",        default: 0
    t.integer  "permission",   default: 0
    t.text     "key",          default: "", null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "door_mat_memberships", ["member_id"], name: "index_door_mat_memberships_on_member_id", using: :btree
  add_index "door_mat_memberships", ["member_of_id"], name: "index_door_mat_memberships_on_member_of_id", using: :btree

  create_table "door_mat_sessions", force: :cascade do |t|
    t.integer  "actor_id"
    t.integer  "email_id"
    t.string   "hashed_token",                  default: "",                    null: false
    t.text     "type",                          default: "",                    null: false
    t.text     "agent",                         default: "",                    null: false
    t.text     "ip",                            default: "",                    null: false
    t.text     "encrypted_symmetric_actor_key", default: "",                    null: false
    t.datetime "password_authenticated_at",     default: '2014-01-01 00:00:00', null: false
    t.integer  "rating",                        default: 0
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
  end

  add_index "door_mat_sessions", ["actor_id"], name: "index_door_mat_sessions_on_actor_id", using: :btree
  add_index "door_mat_sessions", ["hashed_token"], name: "index_door_mat_sessions_on_hashed_token", using: :btree

  create_table "passwords", force: :cascade do |t|
    t.text     "subject",    default: "", null: false
    t.text     "password",   default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "actor_id",                null: false
  end

  add_index "passwords", ["actor_id"], name: "index_passwords_on_actor_id", using: :btree

end
