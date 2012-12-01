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

ActiveRecord::Schema.define(:version => 20121201190608) do

  create_table "subscriptions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "pennies_paid",            :default => 0
    t.datetime "last_paid_at"
    t.datetime "subscription_expires_on"
    t.boolean  "trial_user",              :default => true
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "plan_id"
    t.string   "stripe_customer_token"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "subscription_expires_on"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.boolean  "admin",                   :default => false
  end

  create_table "word_search_puzzles", :force => true do |t|
    t.string   "name",          :default => "New Puzzle 11-19-2012  2:08 pm", :null => false
    t.integer  "times_printed", :default => 0,                                :null => false
    t.text     "words",         :default => "",                               :null => false
    t.datetime "created_at",                                                  :null => false
    t.datetime "updated_at",                                                  :null => false
    t.integer  "grid_width",    :default => 18
    t.integer  "grid_height",   :default => 18
    t.integer  "user_id"
    t.string   "category",      :default => ""
  end

end
