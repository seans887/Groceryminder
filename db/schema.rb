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

ActiveRecord::Schema.define(:version => 20120324210937) do

  create_table "groceries", :force => true do |t|
    t.integer  "list_id"
    t.string   "grocery_name"
    t.float    "unit_increment"
    t.string   "unit"
    t.integer  "upc_code"
    t.float    "current_amount"
    t.float    "use_per_day"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "groceries", ["list_id"], :name => "index_groceries_on_list_id"

  create_table "lists", :force => true do |t|
    t.integer  "user_id"
    t.string   "list_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "lists", ["user_id"], :name => "index_lists_on_user_id"

  create_table "purchases", :force => true do |t|
    t.integer  "grocery_id"
    t.datetime "purchase_date"
    t.float    "purchase_amount"
    t.float    "unit_price"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "purchases", ["grocery_id"], :name => "index_purchases_on_grocery_id"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "email"
    t.string   "password_hash"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "password_salt"
  end

end
