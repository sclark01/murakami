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

ActiveRecord::Schema.define(version: 20150504195852) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author"
  end

  create_table "comments", force: true do |t|
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "desc"
    t.integer  "pageNum"
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id", using: :btree

  create_table "discussions", force: true do |t|
    t.string   "topic"
    t.text     "opPost"
    t.string   "userName"
    t.integer  "userId"
    t.integer  "comment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "discussions", ["comment_id"], name: "index_discussions_on_comment_id", using: :btree

  create_table "replies", force: true do |t|
    t.string   "userName"
    t.integer  "userId"
    t.text     "body"
    t.integer  "discussion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "replies", ["discussion_id"], name: "index_replies_on_discussion_id", using: :btree

  add_foreign_key "comments", "articles", name: "comments_article_id_fk"

end
