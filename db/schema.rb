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

ActiveRecord::Schema.define(version: 20150903161356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "episodes", force: :cascade do |t|
    t.integer  "season"
    t.integer  "number"
    t.text     "description"
    t.string   "title"
    t.string   "day_of_week"
    t.integer  "hour_of_day"
    t.integer  "time_of_hour"
    t.integer  "length"
    t.datetime "air_date"
    t.string   "director"
    t.text     "poster_url"
    t.float    "imdb_rating"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end