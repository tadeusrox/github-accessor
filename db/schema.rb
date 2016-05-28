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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160528025058) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "issues", force: :cascade do |t|
    t.integer  "repository_id"
    t.integer  "pull_id"
    t.boolean  "closed"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "issues", ["repository_id"], name: "index_issues_on_repository_id", using: :btree

  create_table "pull_request_files", force: :cascade do |t|
    t.string   "repository"
    t.integer  "pull_id"
    t.string   "file_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pull_request_files", ["file_path"], name: "index_pull_request_files_on_file_path", using: :btree
  add_index "pull_request_files", ["pull_id"], name: "index_pull_request_files_on_pull_id", using: :btree
  add_index "pull_request_files", ["repository"], name: "index_pull_request_files_on_repository", using: :btree

  create_table "repositories", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "full_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "repositories", ["full_name"], name: "index_repositories_on_full_name", using: :btree
  add_index "repositories", ["user_id"], name: "index_repositories_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "github_login"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "users", ["github_login"], name: "index_users_on_github_login", using: :btree

  add_foreign_key "issues", "repositories"
  add_foreign_key "repositories", "users"
end
