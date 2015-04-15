# -*- encoding : utf-8 -*-
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

ActiveRecord::Schema.define(:version => 20121101103602) do

  create_table "math_tests", :force => true do |t|
    t.datetime "release_date"
    t.text     "B1_content"
    t.decimal  "B1_answer"
    t.text     "B2_content"
    t.string   "B2_image_url"
    t.decimal  "B2_answer"
    t.text     "B3_content"
    t.string   "B3_image_url"
    t.decimal  "B3_answer"
    t.text     "B4_content"
    t.string   "B4_image_url"
    t.decimal  "B4_answer"
    t.text     "B5_content"
    t.decimal  "B5_answer"
    t.text     "B6_content"
    t.string   "B6_image_url"
    t.decimal  "B6_answer"
    t.text     "B7_content"
    t.decimal  "B7_answer"
    t.text     "B8_content"
    t.string   "B8_image_url"
    t.decimal  "B8_answer"
    t.text     "B9_content"
    t.string   "B9_image_url"
    t.decimal  "B9_answer"
    t.text     "B10_content"
    t.decimal  "B10_answer"
    t.text     "B11_content"
    t.string   "B11_image_url"
    t.decimal  "B11_answer"
    t.text     "B12_content"
    t.decimal  "B12_answer"
    t.text     "B13_content"
    t.decimal  "B13_answer"
    t.text     "B14_content"
    t.decimal  "B14_answer"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
