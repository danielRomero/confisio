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

ActiveRecord::Schema.define(version: 20160315195428) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_configurations", force: :cascade do |t|
    t.string   "telefono_movil"
    t.string   "telefono_fijo"
    t.string   "calle"
    t.string   "numero"
    t.string   "cp"
    t.string   "ciudad"
    t.string   "email"
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
    t.text     "landing_images", default: [],                                                      array: true
    t.text     "description"
    t.string   "metro",          default: "Barrio de la concepción"
    t.string   "barrio",         default: "San Pascual, Ciudad Lineal, Arturo Soria"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "permalink",   null: false
    t.integer  "section_id",  null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  create_table "categories_posts", id: false, force: :cascade do |t|
    t.integer "post_id",     null: false
    t.integer "category_id", null: false
  end

  add_index "categories_posts", ["category_id", "post_id"], name: "index_categories_posts_on_category_id_and_post_id", using: :btree
  add_index "categories_posts", ["post_id", "category_id"], name: "index_categories_posts_on_post_id_and_category_id", using: :btree

  create_table "discounts", force: :cascade do |t|
    t.integer  "section_id",  null: false
    t.string   "title",       null: false
    t.text     "conditions"
    t.text     "description"
    t.float    "value"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "permalink"
    t.datetime "valid_to"
  end

  add_index "discounts", ["section_id"], name: "index_discounts_on_section_id", using: :btree

  create_table "free_calls", force: :cascade do |t|
    t.string   "phone"
    t.string   "name"
    t.integer  "section_id"
    t.integer  "status",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "permalink",     null: false
    t.string   "title",         null: false
    t.text     "body",          null: false
    t.integer  "section_id",    null: false
    t.string   "primary_image"
    t.string   "keywords"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "body_preview"
    t.integer  "user_id"
  end

  add_index "posts", ["permalink"], name: "index_posts_on_permalink", unique: true, using: :btree
  add_index "posts", ["section_id", "permalink"], name: "index_posts_on_section_id_and_permalink", unique: true, using: :btree
  add_index "posts", ["section_id"], name: "index_posts_on_section_id", using: :btree

  create_table "prices", force: :cascade do |t|
    t.integer  "section_id"
    t.float    "value"
    t.string   "name"
    t.time     "duration"
    t.string   "unit_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "from"
  end

  create_table "sections", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "permalink",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sections", ["permalink"], name: "index_sections_on_permalink", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "settings", force: :cascade do |t|
    t.integer  "section_id",       null: false
    t.float    "base_price"
    t.text     "meta_keywords"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "email"
    t.text     "description"
    t.time     "session_duration"
  end

  add_index "settings", ["section_id"], name: "index_settings_on_section_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "phone"
    t.string   "gender"
    t.string   "remember_token"
    t.integer  "rank"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "cv"
    t.string   "avatar_url"
    t.string   "contact_email"
    t.string   "contact_phone"
    t.string   "degree"
    t.string   "specialty"
    t.string   "google_plus_url"
    t.string   "permalink"
    t.integer  "section_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
