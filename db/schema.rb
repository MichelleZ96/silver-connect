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

ActiveRecord::Schema[7.1].define(version: 2024_12_10_210246) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applicants", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "experience_1_company"
    t.integer "experience_1_duration_years"
    t.string "experience_1_last_role"
    t.integer "experience_1_industry"
    t.integer "age"
    t.string "experience_2_company"
    t.integer "experience_2_duration_years"
    t.string "experience_2_last_role"
    t.string "experience_2_industry"
    t.string "interested_industry_1"
    t.string "interested_industry_2"
    t.string "interested_industry_3"
    t.string "interested_role_1"
    t.string "interested_role_2"
    t.string "interested_role_3"
    t.integer "bookmarked_jobs_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_applicants_on_email", unique: true
    t.index ["reset_password_token"], name: "index_applicants_on_reset_password_token", unique: true
  end

  create_table "bookmarked_jobs", force: :cascade do |t|
    t.integer "applicant_id"
    t.integer "job_posting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "industry"
    t.string "for_profit_or_non_profit"
    t.text "company_description"
    t.integer "job_postings_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_employers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employers_on_reset_password_token", unique: true
  end

  create_table "job_postings", force: :cascade do |t|
    t.string "title"
    t.text "responsibilities"
    t.text "desired_qualifications"
    t.text "logistics"
    t.string "pay_range"
    t.integer "employer_id"
    t.integer "bookmarked_jobs_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
