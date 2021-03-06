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

ActiveRecord::Schema.define(:version => 20110705153843) do

  create_table "carts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "size36",     :default => 0
    t.integer  "size38",     :default => 0
    t.integer  "size40",     :default => 0
    t.integer  "size42",     :default => 0
    t.integer  "size44",     :default => 0
    t.integer  "size46",     :default => 0
    t.integer  "size48",     :default => 0
    t.integer  "size50",     :default => 0
    t.integer  "size52",     :default => 0
    t.integer  "order_id"
  end

  create_table "orders", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.text     "address"
    t.boolean  "processed",  :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "view"
  end

  create_table "products", :force => true do |t|
    t.text     "description"
    t.string   "material"
    t.decimal  "old_price"
    t.decimal  "new_price"
    t.string   "article"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "type_id"
    t.integer  "size36",      :default => 0
    t.integer  "size38",      :default => 0
    t.integer  "size40",      :default => 0
    t.integer  "size42",      :default => 0
    t.integer  "size44",      :default => 0
    t.integer  "size46",      :default => 0
    t.integer  "size48",      :default => 0
    t.integer  "size50",      :default => 0
    t.integer  "size52",      :default => 0
  end

  create_table "types", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "section"
  end

end
