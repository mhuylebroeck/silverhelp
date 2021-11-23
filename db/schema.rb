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

ActiveRecord::Schema.define(version: 2021_11_22_165345) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "help_requests", force: :cascade do |t|
    t.time "start_time"
    t.integer "duration"
    t.text "task_description"
    t.integer "status"
    t.string "task_category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "senior_id"
    t.bigint "helper_id"
    t.index ["helper_id"], name: "index_help_requests_on_helper_id"
    t.index ["senior_id"], name: "index_help_requests_on_senior_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "phone_number"
    t.string "gender"
    t.text "description"
    t.string "location"
    t.string "user_type"
    t.boolean "vehicle"
    t.integer "points_balance"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "help_requests", "users", column: "helper_id"
  add_foreign_key "help_requests", "users", column: "senior_id"
end
