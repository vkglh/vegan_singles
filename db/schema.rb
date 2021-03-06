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

ActiveRecord::Schema.define(version: 20151228211614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string  "name"
    t.decimal "lat"
    t.decimal "lng"
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "reporter_id"
    t.integer  "reported_id"
    t.text     "reason"
    t.text     "reported_message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "reviewed"
    t.string   "status"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                              default: "",       null: false
    t.string   "encrypted_password",                 default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                               default: "Member"
    t.string   "name",                    limit: 50
    t.text     "bio"
    t.datetime "date_of_birth"
    t.string   "city"
    t.string   "gender"
    t.boolean  "looking_for_male"
    t.boolean  "looking_for_female"
    t.string   "facebook"
    t.string   "instagram"
    t.string   "skype"
    t.string   "twitter"
    t.boolean  "looking_for_genderfluid"
    t.boolean  "looking_for_nonbinary"
    t.string   "avatar"
    t.string   "gallery_img_1"
    t.string   "gallery_img_2"
    t.string   "gallery_img_3"
    t.string   "gallery_img_4"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
