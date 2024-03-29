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

ActiveRecord::Schema.define(:version => 20120301003407) do

  create_table "brands", :force => true do |t|
    t.string   "name"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.string   "photo_file_size"
    t.string   "photo_updated_at"
    t.integer  "person_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.string   "photo_file_size"
    t.string   "photo_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "person_id"
    t.text     "body"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "exhibits", :force => true do |t|
    t.string   "caption"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.string   "photo_file_size"
    t.string   "photo_updated_at"
    t.integer  "person_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "likes", :force => true do |t|
    t.integer  "person_id"
    t.integer  "likable_id"
    t.string   "likable_type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.string   "photo_file_size"
    t.string   "photo_updated_at"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "products", :force => true do |t|
    t.integer  "brand_id"
    t.integer  "category_id"
    t.integer  "person_id"
    t.string   "name"
    t.text     "description"
    t.string   "source"
    t.string   "materials"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.string   "photo_file_size"
    t.string   "photo_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followee_id"
    t.string   "status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "rewards", :force => true do |t|
    t.integer  "rewardable_id"
    t.string   "rewardable_type"
    t.integer  "person_id"
    t.integer  "points"
    t.string   "description"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "caption"
    t.integer  "exhibit_id"
    t.integer  "product_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
