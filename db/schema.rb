# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_25_053714) do

  create_table "directmessages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "room_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_directmessages_on_room_id"
    t.index ["user_id"], name: "index_directmessages_on_user_id"
  end

  create_table "entries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "room_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_entries_on_room_id"
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "group_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_group_users_on_group_id"
    t.index ["user_id"], name: "index_group_users_on_user_id"
  end

  create_table "groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "info", null: false
    t.string "image", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_groups_on_name", unique: true
  end

  create_table "messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "content"
    t.bigint "group_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_messages_on_group_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "country", null: false
    t.string "job", null: false
    t.string "term", null: false
    t.text "introduction"
    t.string "image"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country"], name: "index_users_on_country"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["job"], name: "index_users_on_job"
    t.index ["name"], name: "index_users_on_name"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["term"], name: "index_users_on_term"
  end

  add_foreign_key "group_users", "groups"
  add_foreign_key "group_users", "users"
  add_foreign_key "messages", "groups"
  add_foreign_key "messages", "users"
end
