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

ActiveRecord::Schema.define(version: 2020_12_08_030317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "instructor_languages", force: :cascade do |t|
    t.bigint "instructor_id", null: false
    t.bigint "language_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["instructor_id"], name: "index_instructor_languages_on_instructor_id"
    t.index ["language_id"], name: "index_instructor_languages_on_language_id"
  end

  create_table "instructor_locations", force: :cascade do |t|
    t.bigint "instructor_id", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["instructor_id"], name: "index_instructor_locations_on_instructor_id"
    t.index ["location_id"], name: "index_instructor_locations_on_location_id"
  end

  create_table "instructor_packages", force: :cascade do |t|
    t.integer "price"
    t.bigint "package_id", null: false
    t.bigint "instructor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["instructor_id"], name: "index_instructor_packages_on_instructor_id"
    t.index ["package_id"], name: "index_instructor_packages_on_package_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.string "gender"
    t.text "description"
    t.boolean "available"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_instructors_on_user_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "packages", force: :cascade do |t|
    t.integer "duration"
    t.boolean "photographer"
    t.string "title"
    t.boolean "rental"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.boolean "instructor"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "instructor_languages", "instructors"
  add_foreign_key "instructor_languages", "languages"
  add_foreign_key "instructor_locations", "instructors"
  add_foreign_key "instructor_locations", "locations"
  add_foreign_key "instructor_packages", "instructors"
  add_foreign_key "instructor_packages", "packages"
  add_foreign_key "instructors", "users"
end
