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

ActiveRecord::Schema.define(:version => 20110215165441) do

  create_table "assets", :force => true do |t|
    t.string   "file_name"
    t.string   "file_type"
    t.datetime "published_date"
    t.integer  "size"
    t.integer  "folder_id"
    t.boolean  "online"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "folders", :force => true do |t|
    t.string   "path"
    t.integer  "folder_id"
    t.boolean  "online"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "metadatas", :force => true do |t|
    t.integer  "page_id"
    t.string   "author"
    t.string   "editor"
    t.string   "browser_title"
    t.string   "content_title"
    t.integer  "nav2"
    t.integer  "nav3"
    t.string   "keywords"
    t.string   "description"
    t.boolean  "online"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", :force => true do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_editors", :force => true do |t|
    t.integer  "user_id"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.date     "created_at"
    t.date     "updated_at"
    t.integer  "cms_page_id"
    t.string   "created_by"
    t.string   "updated_by"
    t.string   "reviewed_by"
    t.date     "reviewed_date"
    t.string   "deep_link"
    t.string   "user_state"
    t.string   "template"
    t.date     "next_review_date"
    t.boolean  "online"
    t.integer  "section_id"
    t.integer  "second_level_nav_id"
    t.integer  "third_level_nav_id"
    t.string   "page_type"
    t.string   "file_name"
    t.datetime "published_date"
  end

  create_table "second_level_navs", :force => true do |t|
    t.string   "name"
    t.integer  "cms_page_id"
    t.integer  "section_id"
    t.string   "url"
    t.boolean  "online"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "section_assets", :force => true do |t|
    t.integer  "folder_id"
    t.integer  "section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "section_editors", :force => true do |t|
    t.integer  "user_id"
    t.integer  "section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", :force => true do |t|
    t.string   "name"
    t.string   "path"
    t.boolean  "online"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "third_level_navs", :force => true do |t|
    t.string   "name"
    t.integer  "cms_page_id"
    t.integer  "second_level_nav_id"
    t.string   "url"
    t.boolean  "online"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
