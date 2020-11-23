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

ActiveRecord::Schema.define(version: 2020_11_20_181806) do

  create_table "followers", force: :cascade do |t| #! NOT YET IMPLEMENTED
    t.integer "user_id_followed"
    t.integer "user_id_following"
  end

  create_table "posts", force: :cascade do |t|
    t.string "content"
    t.date "date_added"
    t.boolean "is_public"
    t.integer "votes"
    t.integer "user_id"
  end

  create_table "postvotes", force: :cascade do |t| #! NOT YET IMPLEMENTED
    t.integer "post_id"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

  create_table "votes", force: :cascade do |t| #! NOT YET IMPLEMENTED
    t.integer "score"
  end

end
