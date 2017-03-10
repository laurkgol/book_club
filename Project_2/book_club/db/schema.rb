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

ActiveRecord::Schema.define(version: 20170302155943) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string  "title"
    t.string  "author"
    t.string  "photo_url"
    t.string  "description"
    t.string  "link"
    t.string  "genre"
    t.string  "rating"
    # shouldn't rating be an integer or decimal?
    t.integer "club_id"
    t.integer "meeting_id"
    t.integer "user_id"
    t.index ["club_id"], name: "index_books_on_club_id", using: :btree
    t.index ["meeting_id"], name: "index_books_on_meeting_id", using: :btree
    t.index ["user_id"], name: "index_books_on_user_id", using: :btree
  end

  create_table "clubs", force: :cascade do |t|
    t.string  "name"
    t.string  "start_date"
    t.string  "end_date"
    t.integer "user_id"
    t.index ["user_id"], name: "index_clubs_on_user_id", using: :btree
  end

  create_table "meetings", force: :cascade do |t|
    t.string  "date"
    # for things pertaining to dates or times, best practice is to use datetime data type
    t.string  "location"
    t.string  "host"
    t.integer "club_id"
    t.integer "user_id"
    t.integer "book_id"
    t.index ["book_id"], name: "index_meetings_on_book_id", using: :btree
    t.index ["club_id"], name: "index_meetings_on_club_id", using: :btree
    t.index ["user_id"], name: "index_meetings_on_user_id", using: :btree
  end

  create_table "members", force: :cascade do |t|
    t.string  "name"
    t.string  "email"
    t.string  "street_address"
    t.string  "street_address_2"
    t.string  "city"
    t.string  "state"
    t.string  "zip"
    t.string  "photo_url"
    t.integer "club_id"
    t.integer "user_id"
    t.index ["club_id"], name: "index_members_on_club_id", using: :btree
    t.index ["user_id"], name: "index_members_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.string   "comment"
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_reviews_on_book_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "books", "clubs"
  add_foreign_key "books", "meetings"
  add_foreign_key "books", "users"
  add_foreign_key "clubs", "users"
  add_foreign_key "meetings", "clubs"
  add_foreign_key "meetings", "users"
  add_foreign_key "members", "clubs"
  add_foreign_key "members", "users"
  add_foreign_key "reviews", "books"
  add_foreign_key "reviews", "users"
end
