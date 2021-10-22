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

ActiveRecord::Schema.define(version: 2021_10_22_022133) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.string "description"
    t.text "images", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "category_assignments", force: :cascade do |t|
    t.bigint "dish_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_category_assignments_on_category_id"
    t.index ["dish_id"], name: "index_category_assignments_on_dish_id"
  end

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.string "description"
    t.text "images", default: [], array: true
    t.text "places", default: [], array: true
    t.integer "likeCount", default: 0
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_dishes_on_category_id"
  end

  add_foreign_key "category_assignments", "categories"
  add_foreign_key "category_assignments", "dishes"
  add_foreign_key "dishes", "categories"
end
