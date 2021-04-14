ActiveRecord::Schema.define(version: 2021_04_13_235733) do

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "date_of_birth"
    t.string "phone"
    t.string "address"
    t.string "credit_card"
    t.string "franchise"
    t.string "email"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "account_number"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "credit_cards", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "contacts", "users"
end
