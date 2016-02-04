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

ActiveRecord::Schema.define(version: 20160204105232) do

  create_table "authors", force: :cascade do |t|
    t.integer  "package_version_id", limit: 4
    t.integer  "person_id",          limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "authors", ["package_version_id"], name: "index_authors_on_package_version_id", using: :btree
  add_index "authors", ["person_id"], name: "index_authors_on_person_id", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "maintainers", force: :cascade do |t|
    t.integer  "package_version_id", limit: 4
    t.integer  "person_id",          limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "maintainers", ["package_version_id"], name: "index_maintainers_on_package_version_id", using: :btree
  add_index "maintainers", ["person_id"], name: "index_maintainers_on_person_id", using: :btree

  create_table "package_versions", force: :cascade do |t|
    t.integer  "package_id",          limit: 4
    t.string   "version",             limit: 255
    t.date     "date_of_publication"
    t.text     "description",         limit: 65535
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "package_versions", ["package_id"], name: "index_package_versions_on_package_id", using: :btree
  add_index "package_versions", ["version"], name: "index_package_versions_on_version", using: :btree

  create_table "packages", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "packages", ["name"], name: "index_packages_on_name", using: :btree

  create_table "people", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "people", ["email"], name: "index_people_on_email", using: :btree

  create_table "proxy_packages", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "version",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
