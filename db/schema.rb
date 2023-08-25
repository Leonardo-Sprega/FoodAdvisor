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

ActiveRecord::Schema[7.0].define(version: 2023_08_24_134058) do
  create_table "foto_ristorantes", force: :cascade do |t|
    t.string "url"
    t.integer "ristorante_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ristorante_id"], name: "index_foto_ristorantes_on_ristorante_id"
  end

  create_table "homes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "like_recensiones", force: :cascade do |t|
    t.integer "recensione_id", null: false
    t.integer "utente_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recensione_id"], name: "index_like_recensiones_on_recensione_id"
    t.index ["utente_id"], name: "index_like_recensiones_on_utente_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "ristorante_id", null: false
    t.integer "utente_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ristorante_id"], name: "index_likes_on_ristorante_id"
    t.index ["utente_id"], name: "index_likes_on_utente_id"
  end

  create_table "piattos", force: :cascade do |t|
    t.string "nome"
    t.text "descrizione"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ristorante_id", null: false
    t.integer "prezzo"
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
    t.integer "utente_id", null: false
    t.integer "ristorante_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ristorante_id"], name: "index_prenotaziones_on_ristorante_id"
    t.index ["utente_id"], name: "index_prenotaziones_on_utente_id"
  end

  create_table "recensiones", force: :cascade do |t|
    t.string "titolo"
    t.text "commento"
    t.datetime "datavisita"
    t.datetime "datarecensione"
    t.integer "valutazione"
    t.integer "prezzo"
    t.integer "utente_id", null: false
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
    t.index ["utente_id"], name: "index_recensiones_on_utente_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "utente_id", null: false
    t.integer "tipo_cucina_id"
    t.string "latitudine"
    t.string "longitudine"
    t.index ["utente_id"], name: "index_ristorantes_on_utente_id"
  end

  create_table "tipo_cucinas", force: :cascade do |t|
    t.string "nome"
    t.text "descrizione"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "utentes", force: :cascade do |t|
    t.string "username"
    t.string "nome"
    t.string "cognome"
    t.string "cap_regione"
    t.integer "telefono"
    t.string "email"
    t.string "password_digest"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "ristoratore"
  end

  add_foreign_key "foto_ristorantes", "ristorantes"
  add_foreign_key "like_recensiones", "recensiones"
  add_foreign_key "like_recensiones", "utentes"
  add_foreign_key "likes", "ristorantes"
  add_foreign_key "likes", "utentes"
  add_foreign_key "piattos", "ristorantes"
  add_foreign_key "prenotaziones", "ristorantes"
  add_foreign_key "prenotaziones", "utentes"
  add_foreign_key "recensiones", "ristorantes"
  add_foreign_key "recensiones", "utentes"
  add_foreign_key "ristorantes", "utentes"
end
