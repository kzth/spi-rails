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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121020094511) do

  create_table "dougis", :force => true do |t|
    t.string   "question",  :null => false
    t.string   "answer",    :null => false
    t.integer  "level"
    t.string   "category"
    t.datetime "create_at"
    t.datetime "update_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "taigis", :force => true do |t|
    t.string   "question",  :null => false
    t.string   "answer",    :null => false
    t.integer  "level"
    t.string   "category"
    t.datetime "create_at"
    t.datetime "update_at"
  end

  create_table "users", :force => true do |t|
    t.string   "account_name",                :null => false
    t.string   "password",                    :null => false
    t.date     "logout_at"
    t.integer  "login_count",  :default => 0
    t.datetime "sum_time"
    t.integer  "level",        :default => 1
    t.integer  "point",        :default => 0
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

end
