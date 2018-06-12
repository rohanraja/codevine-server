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

ActiveRecord::Schema.define(version: 20180612030508) do

  create_table "clr_class_instances", force: :cascade do |t|
    t.string "instanceId"
    t.string "className"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clrclass_vars", force: :cascade do |t|
    t.integer "var_instance_id"
    t.integer "clr_class_instance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_runs", force: :cascade do |t|
    t.integer "lineNo"
    t.integer "timeStamp"
    t.integer "method_run_id"
    t.string "methodRunningState", default: "RUNNING"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "method_runs", force: :cascade do |t|
    t.string "mrid"
    t.string "relativeFilePath"
    t.string "methodName"
    t.string "threadid"
    t.integer "clr_class_instance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "methodrun_vars", force: :cascade do |t|
    t.integer "var_instance_id"
    t.integer "method_run_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "source_file_infos", force: :cascade do |t|
    t.integer "source_code_info_id"
    t.string "code"
    t.string "relativePath"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "value_holders", force: :cascade do |t|
    t.string "rawValue"
    t.integer "timeStamp"
    t.integer "var_instance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "var_instances", force: :cascade do |t|
    t.string "name"
    t.string "vartype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
