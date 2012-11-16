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

ActiveRecord::Schema.define(:version => 20121116165349) do

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "last_paid_at"
    t.integer  "pennies_paid",            :default => 0
    t.datetime "subscription_expires_on"
    t.boolean  "paid_user",               :default => false
    t.boolean  "trial_user",              :default => true
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.boolean  "admin",                   :default => false
  end

  create_table "word_search_puzzles", :force => true do |t|
    t.string   "name",       :default => "New Puzzle", :null => false
    t.integer  "times_used", :default => 0,            :null => false
    t.text     "words",      :default => "",           :null => false
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

end
