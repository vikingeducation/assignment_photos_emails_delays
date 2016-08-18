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

ActiveRecord::Schema.define(version: 20160818181056) do

  create_table "users", force: :cascade do |t|
    t.string   "username",                   limit: 255
    t.string   "email",                      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.binary   "profile_photo"
    t.binary   "data"
    t.binary   "filename"
    t.binary   "mime_type"
    t.string   "profile_photo_file_name",    limit: 255
    t.string   "profile_photo_content_type", limit: 255
    t.integer  "profile_photo_file_size"
    t.datetime "profile_photo_updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
