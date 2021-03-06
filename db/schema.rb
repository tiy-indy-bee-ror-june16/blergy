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

ActiveRecord::Schema.define(version: 20160804154640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addendums", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "commentable_type", default: "Post"
    t.index ["commentable_id"], name: "index_addendums_on_commentable_id", using: :btree
    t.index ["user_id"], name: "index_addendums_on_user_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "thumbs", force: :cascade do |t|
    t.integer  "value"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_thumbs_on_post_id", using: :btree
    t.index ["user_id"], name: "index_thumbs_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.text     "bio"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "role",            default: "user"
  end

  add_foreign_key "addendums", "posts", column: "commentable_id"
  add_foreign_key "addendums", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "thumbs", "posts"
  add_foreign_key "thumbs", "users"
end
