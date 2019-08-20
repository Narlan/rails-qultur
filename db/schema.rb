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

ActiveRecord::Schema.define(version: 2019_08_20_070054) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "hunt_id"
    t.bigint "proposal_id"
    t.string "content"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hunt_id"], name: "index_answers_on_hunt_id"
    t.index ["proposal_id"], name: "index_answers_on_proposal_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "hunts", force: :cascade do |t|
    t.boolean "current_hunt"
    t.integer "score"
    t.string "progress"
    t.bigint "monument_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["monument_id"], name: "index_hunts_on_monument_id"
    t.index ["user_id"], name: "index_hunts_on_user_id"
  end

  create_table "monuments", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "photo"
    t.string "address"
    t.string "qrcode"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proposals", force: :cascade do |t|
    t.boolean "success"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.integer "position"
    t.bigint "monument_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["monument_id"], name: "index_questions_on_monument_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.float "longitude"
    t.float "latitude"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "hunts"
  add_foreign_key "answers", "proposals"
  add_foreign_key "answers", "questions"
  add_foreign_key "hunts", "monuments"
  add_foreign_key "hunts", "users"
  add_foreign_key "questions", "monuments"
end
