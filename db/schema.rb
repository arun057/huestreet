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

ActiveRecord::Schema.define(:version => 20121118032505) do

  create_table "assets", :force => true do |t|
    t.string   "lat"
    t.string   "lng"
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "authorizations", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "collections", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "collections_assets", :force => true do |t|
    t.integer "collection_id"
    t.integer "asset_id"
  end

  add_index "collections_assets", ["asset_id", "collection_id"], :name => "index_collections_assets_on_asset_id_and_collection_id"
  add_index "collections_assets", ["collection_id", "asset_id"], :name => "index_collections_assets_on_collection_id_and_asset_id"

  create_table "colorhues", :force => true do |t|
    t.string   "name"
    t.string   "hex"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "colorhues_assets", :force => true do |t|
    t.integer "colorhue_id"
    t.integer "asset_id"
    t.decimal "percent",     :precision => 5, :scale => 2
  end

  add_index "colorhues_assets", ["asset_id", "colorhue_id"], :name => "index_colorhues_assets_on_asset_id_and_colorhue_id"
  add_index "colorhues_assets", ["colorhue_id", "asset_id"], :name => "index_colorhues_assets_on_colorhue_id_and_asset_id"
  add_index "colorhues_assets", ["percent"], :name => "index_colorhues_assets_on_percent"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "user_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
