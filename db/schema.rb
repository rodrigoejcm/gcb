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

ActiveRecord::Schema.define(version: 20170118200253) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "bootsy_image_galleries", force: :cascade do |t|
    t.string   "bootsy_resource_type"
    t.integer  "bootsy_resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", force: :cascade do |t|
    t.string   "image_file"
    t.integer  "image_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categorias", force: :cascade do |t|
    t.string   "nomeCategoria"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "eventos", force: :cascade do |t|
    t.string   "titulo",           limit: 150
    t.text     "descricao"
    t.string   "local"
    t.datetime "data_hora_inicio"
    t.datetime "data_hora_fim"
    t.string   "aprovado",                     default: "INDEFINIDO"
    t.integer  "usuario_id"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "image"
    t.string   "pais"
    t.string   "estadoprovincia"
    t.string   "cidade"
    t.index ["usuario_id"], name: "index_eventos_on_usuario_id", using: :btree
  end

  create_table "locais", force: :cascade do |t|
    t.string   "nome"
    t.text     "descricao"
    t.string   "endereco"
    t.string   "cidade"
    t.string   "estadoprovincia"
    t.string   "pais"
    t.string   "contato1"
    t.string   "contato2"
    t.string   "imagem"
    t.string   "mapa"
    t.integer  "usuario_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["usuario_id"], name: "index_locais_on_usuario_id", using: :btree
  end

  create_table "perfis", force: :cascade do |t|
    t.string   "imagemPerfil"
    t.integer  "usuario_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "descricao"
    t.string   "imagemCapa"
    t.date     "datacap"
    t.date     "datagcb"
    t.string   "corda"
    t.index ["usuario_id"], name: "index_perfis_on_usuario_id", using: :btree
  end

  create_table "publicacoes", force: :cascade do |t|
    t.string   "titulo"
    t.text     "texto_publicacao"
    t.integer  "usuario_id"
    t.string   "image"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "aprovado",         default: "INDEFINIDO"
    t.integer  "categoria_id"
    t.index ["categoria_id"], name: "index_publicacoes_on_categoria_id", using: :btree
    t.index ["usuario_id"], name: "index_publicacoes_on_usuario_id", using: :btree
  end

  create_table "turmas", force: :cascade do |t|
    t.integer  "local_id"
    t.integer  "usuario_id"
    t.string   "dias"
    t.string   "periodo"
    t.time     "hora_inicio"
    t.time     "hora_fim"
    t.string   "publico"
    t.text     "observacoes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "dia_seg"
    t.boolean  "dia_ter"
    t.boolean  "dia_qua"
    t.boolean  "dia_qui"
    t.boolean  "dia_sex"
    t.boolean  "dia_sab"
    t.boolean  "dia_dom"
    t.boolean  "turma_ativa"
    t.index ["local_id"], name: "index_turmas_on_local_id", using: :btree
    t.index ["usuario_id"], name: "index_turmas_on_usuario_id", using: :btree
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "nome"
    t.string   "sobrenome"
    t.string   "apelido"
    t.string   "sexo"
    t.string   "graduacao"
    t.string   "nome_professor"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "role"
    t.boolean  "approved",               default: false
    t.string   "telefone"
    t.index ["approved"], name: "index_usuarios_on_approved", using: :btree
    t.index ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "eventos", "usuarios"
  add_foreign_key "locais", "usuarios"
  add_foreign_key "perfis", "usuarios"
  add_foreign_key "publicacoes", "categorias"
  add_foreign_key "publicacoes", "usuarios"
  add_foreign_key "turmas", "locais"
  add_foreign_key "turmas", "usuarios"
end
