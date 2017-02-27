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

ActiveRecord::Schema.define(version: 20170224201159) do

  create_table "books", force: :cascade do |t|
    t.string  "title"
    t.string  "author"
    t.string  "photo_url"
    t.string  "description"
    t.string  "link"
    t.string  "genre"
    t.string  "rating"
    t.integer "club_id"
    t.integer "meeting_id"
    t.index ["club_id"], name: "index_books_on_club_id"
    t.index ["meeting_id"], name: "index_books_on_meeting_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "start_date"
    t.string "end_date"
  end

  create_table "meetings", force: :cascade do |t|
    t.string  "date"
    t.string  "location"
    t.string  "host"
    t.integer "member_id"
    t.integer "book_id"
    t.integer "club_id"
    t.index ["book_id"], name: "index_meetings_on_book_id"
    t.index ["club_id"], name: "index_meetings_on_club_id"
    t.index ["member_id"], name: "index_meetings_on_member_id"
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
    t.index ["club_id"], name: "index_members_on_club_id"
  end

end