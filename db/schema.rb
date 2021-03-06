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

ActiveRecord::Schema.define(:version => 20131016165650) do

  create_table "exercise_sets", :force => true do |t|
    t.integer  "exercise_id"
    t.integer  "reps"
    t.integer  "rest_period"
    t.integer  "workout_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "distance"
    t.integer  "time"
    t.string   "notes"
    t.integer  "sets"
  end

  add_index "exercise_sets", ["exercise_id"], :name => "index_exercise_sets_on_exercise_id"
  add_index "exercise_sets", ["workout_id"], :name => "index_exercise_sets_on_workout_id"

  create_table "exercises", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "set_records", :force => true do |t|
    t.float    "weight"
    t.integer  "exercise_set_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "set_records", ["exercise_set_id"], :name => "index_set_records_on_exercise_set_id"

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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "workouts", :force => true do |t|
    t.string   "description"
    t.date     "due_date"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.boolean  "completed"
    t.datetime "completion_date"
    t.text     "instructions"
  end

  add_index "workouts", ["user_id"], :name => "index_workouts_on_user_id"

end
