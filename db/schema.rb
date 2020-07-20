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

ActiveRecord::Schema.define(version: 20171216124057) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accommodations", force: :cascade do |t|
    t.string "name"
    t.string "maplink"
    t.string "tel"
    t.string "email"
    t.text "description"
    t.bigint "category_id"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["category_id"], name: "index_accommodations_on_category_id"
    t.index ["city_id"], name: "index_accommodations_on_city_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "image_accommodations", force: :cascade do |t|
    t.string "name"
    t.bigint "accommodation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["accommodation_id"], name: "index_image_accommodations_on_accommodation_id"
  end

  create_table "image_rooms", force: :cascade do |t|
    t.string "name"
    t.bigint "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["room_id"], name: "index_image_rooms_on_room_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.string "name"
    t.bigint "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["room_id"], name: "index_pictures_on_room_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "accommodation_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "room_number"
    t.text "description"
    t.bigint "accommodation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "price"
    t.index ["accommodation_id"], name: "index_rooms_on_accommodation_id"
  end

  create_table "search_rooms", force: :cascade do |t|
    t.decimal "price"
    t.decimal "min_price"
    t.decimal "max_price"
    t.integer "category_id"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "searches", force: :cascade do |t|
    t.string "keywords"
    t.integer "category_id"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wallpapers", force: :cascade do |t|
    t.string "name"
    t.bigint "accommodation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["accommodation_id"], name: "index_wallpapers_on_accommodation_id"
  end

  add_foreign_key "accommodations", "categories"
  add_foreign_key "accommodations", "cities"
  add_foreign_key "image_accommodations", "accommodations"
  add_foreign_key "image_rooms", "rooms"
  add_foreign_key "pictures", "rooms"
  add_foreign_key "rooms", "accommodations"
  add_foreign_key "wallpapers", "accommodations"
end
