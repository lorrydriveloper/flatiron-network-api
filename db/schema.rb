# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_22_124340) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "postcode"
    t.string "state"
    t.string "country"
    t.string "plus_code"
    t.float "latitude"
    t.float "longitude"
    t.string "addressable_type", null: false
    t.bigint "addressable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "campus", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "campus_courses", force: :cascade do |t|
    t.bigint "campus_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campus_id"], name: "index_campus_courses_on_campus_id"
    t.index ["course_id"], name: "index_campus_courses_on_course_id"
  end

  create_table "cohorts", force: :cascade do |t|
    t.string "cohort_lead"
    t.bigint "campus_id", null: false
    t.bigint "course_id", null: false
    t.date "graduation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campus_id"], name: "index_cohorts_on_campus_id"
    t.index ["course_id"], name: "index_cohorts_on_course_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "password_digest"
    t.boolean "is_admin"
    t.boolean "graduate"
    t.bigint "cohort_id", null: false
    t.boolean "work_remotely"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cohort_id"], name: "index_users_on_cohort_id"
  end

  add_foreign_key "campus_courses", "campus", column: "campus_id"
  add_foreign_key "campus_courses", "courses"
  add_foreign_key "cohorts", "campus", column: "campus_id"
  add_foreign_key "cohorts", "courses"
  add_foreign_key "users", "cohorts"
end
