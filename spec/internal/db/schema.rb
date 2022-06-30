# frozen_string_literal: true

ActiveRecord::Schema.define do
  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.index ["post_id"], name: "index_posts_users_on_post_id"
    t.index ["user_id"], name: "index_posts_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.text "profile"
    t.string "email"
    t.integer "siblings"
    t.integer "gender", default: 0
    t.string "phone"
    t.datetime "birthday"
    t.string "homepage"
    t.string "time_zone", default: "UTC"
    t.string "favorite_color"
    t.boolean "accepted_eula"
    t.text "biography"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "posts_users", "posts", on_delete: :cascade
  add_foreign_key "posts_users", "users", on_delete: :cascade
end
