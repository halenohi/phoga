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

ActiveRecord::Schema.define(version: 20140221091724) do

  create_table "phoga_admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.text     "description"
    t.text     "url"
    t.string   "avatar"
  end

  add_index "phoga_admins", ["authentication_token"], name: "index_phoga_admins_on_authentication_token", unique: true
  add_index "phoga_admins", ["confirmation_token"], name: "index_phoga_admins_on_confirmation_token", unique: true
  add_index "phoga_admins", ["email"], name: "index_phoga_admins_on_email", unique: true
  add_index "phoga_admins", ["reset_password_token"], name: "index_phoga_admins_on_reset_password_token", unique: true
  add_index "phoga_admins", ["unlock_token"], name: "index_phoga_admins_on_unlock_token", unique: true

  create_table "phoga_articles", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "published_at"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phoga_categories", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "parent_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "phoga_categories", ["name"], name: "index_phoga_categories_on_name"
  add_index "phoga_categories", ["parent_id"], name: "index_phoga_categories_on_parent_id"
  add_index "phoga_categories", ["slug"], name: "index_phoga_categories_on_slug"

  create_table "phoga_categorizations", force: true do |t|
    t.string   "categorizable_type"
    t.integer  "categorizable_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "phoga_categorizations", ["categorizable_type", "categorizable_id", "category_id"], name: "categorizable_index"

  create_table "phoga_comments", force: true do |t|
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.string   "author_name"
    t.string   "author_email"
    t.text     "body"
    t.datetime "published_at"
    t.integer  "reply_to_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "phoga_comments", ["commentable_type", "commentable_id"], name: "commentable_index"

  create_table "phoga_custom_fields", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.string   "image"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "phoga_custom_fields", ["name"], name: "index_phoga_custom_fields_on_name"

  create_table "phoga_taggings", force: true do |t|
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "phoga_taggings", ["taggable_type", "taggable_id", "tag_id"], name: "taggable_index"

  create_table "phoga_tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "phoga_tags", ["name"], name: "index_phoga_tags_on_name", unique: true

end
