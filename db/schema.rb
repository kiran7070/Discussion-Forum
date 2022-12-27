# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_27_051536) do
  create_table "comments", force: :cascade do |t|
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_time"
    t.integer "discussion_id"
    t.string "username"
    t.index ["discussion_id"], name: "index_comments_on_discussion_id"
  end

  create_table "discussions", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_time"
    t.integer "likes", default: 0
    t.string "name"
    t.string "image"
    t.boolean "pinned", default: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "likeno"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "discussion_id"
    t.index ["discussion_id"], name: "index_likes_on_discussion_id"
  end

  create_table "replies", force: :cascade do |t|
    t.string "reply"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "comment_id"
    t.index ["comment_id"], name: "index_replies_on_comment_id"
  end

end
