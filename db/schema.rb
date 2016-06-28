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

ActiveRecord::Schema.define(version: 20160626165324) do

  create_table "activities", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "room_id"
    t.string   "title"
    t.text     "description"
    t.string   "activity_type"
    t.integer  "vacancies"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["room_id"], name: "index_activities_on_room_id"
    t.index ["teacher_id"], name: "index_activities_on_teacher_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "name"
    t.text     "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
