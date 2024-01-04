# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_01_01_210853) do
  create_table "foto_ristorantes", force: :cascade do |t|
    t.string "url"
    t.integer "ristorante_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ristorante_id"], name: "index_foto_ristorantes_on_ristorante_id"
  end

  create_table "like_recensiones", force: :cascade do |t|
    t.integer "recensione_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recensione_id"], name: "index_like_recensiones_on_recensione_id"
    t.index ["user_id"], name: "index_like_recensiones_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "ristorante_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ristorante_id"], name: "index_likes_on_ristorante_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "piattos", force: :cascade do |t|
    t.string "nome"
    t.text "descrizione"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ristorante_id", null: false
    t.integer "prezzo"
    t.boolean "speciale"
    t.index ["ristorante_id"], name: "index_piattos_on_ristorante_id"
  end

  create_table "prenotaziones", force: :cascade do |t|
    t.time "ora"
    t.datetime "data"
    t.string "nomecliente"
    t.string "cognomecliente"
    t.integer "telefonocliente"
    t.string "emailcliente"
    t.integer "nadulti"
    t.integer "nbambini"
    t.text "messaggio"
    t.integer "user_id", null: false
    t.integer "ristorante_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ristorante_id"], name: "index_prenotaziones_on_ristorante_id"
    t.index ["user_id"], name: "index_prenotaziones_on_user_id"
  end

  create_table "recensiones", force: :cascade do |t|
    t.string "titolo"
    t.text "commento"
    t.datetime "datavisita"
    t.integer "valutazione"
    t.integer "prezzo"
    t.integer "user_id", null: false
    t.integer "ristorante_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "foto1"
    t.string "foto2"
    t.string "foto3"
    t.string "foto4"
    t.string "foto5"
    t.string "foto6"
    t.index ["ristorante_id"], name: "index_recensiones_on_ristorante_id"
    t.index ["user_id"], name: "index_recensiones_on_user_id"
  end

  create_table "ristorantes", force: :cascade do |t|
    t.string "nome"
    t.string "regione"
    t.string "provincia"
    t.string "citta"
    t.string "indirizzo"
    t.string "cap"
    t.string "email"
    t.integer "telefono"
    t.string "sitoweb1"
    t.string "sitoweb2"
    t.string "sitoweb3"
    t.text "descrizione"
    t.time "oraapertura"
    t.time "orachiusura"
    t.integer "tipo_cucina_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitudine"
    t.float "longitudine"
    t.integer "user_id", null: false
    t.index ["tipo_cucina_id"], name: "index_ristorantes_on_tipo_cucina_id"
    t.index ["user_id"], name: "index_ristorantes_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "tipo_cucinas", force: :cascade do |t|
    t.string "nome"
    t.text "descrizione"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider", limit: 50, default: "", null: false
    t.string "uid", limit: 500, default: "", null: false
    t.string "nome", limit: 50, default: "", null: false
    t.string "cognome", limit: 50, default: "", null: false
    t.string "citta", limit: 50, default: "", null: false
    t.string "provincia", limit: 50, default: "", null: false
    t.string "cap", limit: 10, default: "", null: false
    t.string "ristoratore", limit: 10, default: "No", null: false
    t.string "avatar", limit: 500, default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "foto_ristorantes", "ristorantes"
  add_foreign_key "like_recensiones", "recensiones"
  add_foreign_key "like_recensiones", "users"
  add_foreign_key "likes", "ristorantes"
  add_foreign_key "likes", "users"
  add_foreign_key "piattos", "ristorantes"
  add_foreign_key "prenotaziones", "ristorantes"
  add_foreign_key "prenotaziones", "users"
  add_foreign_key "recensiones", "ristorantes"
  add_foreign_key "recensiones", "users"
  add_foreign_key "ristorantes", "tipo_cucinas"
  add_foreign_key "ristorantes", "users"
end
