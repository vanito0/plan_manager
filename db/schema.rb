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

ActiveRecord::Schema.define(version: 2023_11_22_024558) do

  create_table "plans", force: :cascade do |t|
    t.string "title", limit: 30, null: false
    t.boolean "fulltime_flag", null: false
    t.datetime "start_time"
    t.datetime "finish_time"
    t.date "plan_date"
    t.boolean "must_flag", null: false
    t.text "content", limit: 300
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
