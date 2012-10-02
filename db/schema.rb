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

ActiveRecord::Schema.define(:version => 20120625052345) do

  create_table "indicator_father_son", :id => false, :force => true do |t|
    t.integer "indicatorfather_id"
    t.integer "indicatorson_id"
  end

  create_table "indicator_scores", :force => true do |t|
    t.integer  "indicator_id"
    t.integer  "scoredate_id"
    t.float    "score"
    t.float    "goal",         :default => 0.0
    t.float    "redfrom"
    t.float    "redto"
    t.float    "yellowfrom"
    t.float    "yellowto"
    t.float    "greenfrom"
    t.float    "greento"
    t.float    "baseline"
    t.float    "growth"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "indicators", :force => true do |t|
    t.string   "name"
    t.string   "acronym"
    t.float    "weight"
    t.integer  "objective_id"
    t.integer  "operation_id"
    t.float    "redfrom"
    t.float    "redto"
    t.float    "yellowfrom"
    t.float    "yellowto"
    t.float    "greenfrom"
    t.float    "greento"
    t.float    "progress"
    t.float    "baseline"
    t.float    "growth"
    t.string   "unit"
    t.string   "formula"
    t.boolean  "show",         :default => true
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "indicators_objectives", :id => false, :force => true do |t|
    t.integer "indicator_id"
    t.integer "objective_id"
  end

  create_table "objective_scores", :force => true do |t|
    t.integer  "objective_id"
    t.integer  "scoredate_id"
    t.float    "score"
    t.float    "redfrom"
    t.float    "redto"
    t.float    "yellowfrom"
    t.float    "yellowto"
    t.float    "greenfrom"
    t.float    "greento"
    t.float    "progress"
    t.float    "baseline"
    t.float    "growth"
    t.float    "goal"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "objectives", :force => true do |t|
    t.string   "name"
    t.string   "acronym"
    t.float    "weight"
    t.float    "score"
    t.integer  "perspective_id"
    t.float    "redfrom"
    t.float    "redto"
    t.float    "yellowfrom"
    t.float    "yellowto"
    t.float    "greenfrom"
    t.float    "greento"
    t.float    "progress"
    t.float    "baseline"
    t.float    "growth"
    t.string   "measurement"
    t.boolean  "show",           :default => true
    t.string   "greenButton"
    t.string   "redbutton"
    t.integer  "col"
    t.integer  "row"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "operations", :force => true do |t|
    t.string   "name"
    t.string   "operator",         :limit => 1
    t.integer  "firstoperand_id"
    t.integer  "secondoperand_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "perspective_scores", :force => true do |t|
    t.integer  "perspective_id"
    t.integer  "scoredate_id"
    t.float    "score"
    t.float    "redfrom"
    t.float    "redto"
    t.float    "yellowfrom"
    t.float    "yellowto"
    t.float    "greenfrom"
    t.float    "greento"
    t.float    "goal"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "perspectives", :force => true do |t|
    t.string   "name"
    t.float    "weight"
    t.float    "redfrom"
    t.float    "redto"
    t.float    "yellowfrom"
    t.float    "yellowto"
    t.float    "greenfrom"
    t.float    "greento"
    t.string   "title_image"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "raw_data", :force => true do |t|
    t.string   "name"
    t.string   "hint"
    t.integer  "operation_id"
    t.float    "default_value", :default => 1.0
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "raw_data_scores", :force => true do |t|
    t.integer  "scoredate_id"
    t.float    "value"
    t.integer  "rawdata_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "score_dates", :force => true do |t|
    t.integer  "month"
    t.integer  "year"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "vectors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "vectors_objectives", :id => false, :force => true do |t|
    t.integer "vector_id"
    t.integer "objective_id"
  end

end
