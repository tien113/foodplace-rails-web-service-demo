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

ActiveRecord::Schema.define(:version => 20121010115801) do

  create_table "foods", :force => true do |t|
    t.string   "food_name"
    t.decimal  "food_price",      :precision => 7, :scale => 2
    t.string   "food_image_url"
    t.text     "food_ingredient"
    t.integer  "place_id"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  add_index "foods", ["place_id"], :name => "index_foods_on_place_id"

  create_table "order_details", :force => true do |t|
    t.string   "food_name"
    t.integer  "food_count"
    t.decimal  "food_price", :precision => 7, :scale => 2
    t.string   "food_place"
    t.integer  "order_id"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "order_details", ["order_id"], :name => "index_order_details_on_order_id"

  create_table "orders", :force => true do |t|
    t.string   "order_uuid"
    t.decimal  "order_total", :precision => 7, :scale => 2
    t.string   "order_date"
    t.boolean  "order_done"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "orders", ["order_uuid"], :name => "index_orders_on_order_uuid"

  create_table "places", :force => true do |t|
    t.string   "place_name"
    t.decimal  "place_lat",            :precision => 15, :scale => 10
    t.decimal  "place_log",            :precision => 15, :scale => 10
    t.string   "place_address"
    t.string   "place_opening_time_1"
    t.string   "place_opening_time_2"
    t.string   "place_opening_time_3"
    t.string   "place_opening_time_4"
    t.string   "place_phone_number"
    t.string   "place_email"
    t.string   "place_image_url"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "remember_token"
    t.string   "name"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
