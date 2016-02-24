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

ActiveRecord::Schema.define(version: 20160224072557) do

  create_table "options", force: :cascade do |t|
    t.string   "text"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "options", ["question_id"], name: "index_options_on_question_id"

  create_table "progresses", force: :cascade do |t|
    t.integer  "step_id"
    t.integer  "reviewer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "progresses", ["reviewer_id"], name: "index_progresses_on_reviewer_id"
  add_index "progresses", ["step_id"], name: "index_progresses_on_step_id"

  create_table "questions", force: :cascade do |t|
    t.string   "text"
    t.integer  "step_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "questions", ["step_id"], name: "index_questions_on_step_id"

  create_table "responses", force: :cascade do |t|
    t.string   "text"
    t.integer  "reviewer_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "responses", ["question_id"], name: "index_responses_on_question_id"
  add_index "responses", ["reviewer_id"], name: "index_responses_on_reviewer_id"

  create_table "reviewers", force: :cascade do |t|
    t.string   "name"
    t.string   "telegram_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "steps", force: :cascade do |t|
    t.string   "name"
    t.string   "step_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "wizard_id"
  end

  add_index "steps", ["wizard_id"], name: "index_steps_on_wizard_id"

  create_table "wizards", force: :cascade do |t|
    t.string   "name"
    t.string   "start_keyword"
    t.string   "reset_keyword"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
