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

ActiveRecord::Schema.define(:version => 20140331020754) do

  create_table "authentications", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "profile_pic_url_from_provider"
    t.string   "auth_token"
    t.integer  "user_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "author_associated_quote", :force => true do |t|
    t.integer  "author_id"
    t.integer  "quote_id"
    t.datetime "assign_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "author_associated_quotes", :force => true do |t|
    t.integer  "author_id"
    t.integer  "quote_id"
    t.datetime "assign_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "authors", :force => true do |t|
    t.string "friendly_name"
    t.string "slug"
    t.text   "description"
    t.string "image_url"
  end

  create_table "followerships", :force => true do |t|
    t.integer "user_id"
    t.integer "follower_id"
  end

  create_table "notification_settings", :force => true do |t|
    t.boolean  "daily_email"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "quotes", :force => true do |t|
    t.text     "quote_text"
    t.text     "author"
    t.text     "url_slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tag_associated_quotes", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "quote_id"
    t.datetime "assign_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tags", :force => true do |t|
    t.text "tag_title"
    t.text "url_slug"
  end

  create_table "user_associated_quotes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "quote_id"
    t.datetime "assign_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "first_name",             :default => "", :null => false
    t.string   "last_name",              :default => "", :null => false
    t.string   "username",               :default => "", :null => false
    t.string   "set_profile_pic_url"
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "quote_id"
    t.datetime "vote_date"
  end

end
