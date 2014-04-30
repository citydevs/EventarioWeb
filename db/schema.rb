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

ActiveRecord::Schema.define(version: 20140415211459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "eventos", force: true do |t|
    t.string   "nombre"
    t.string   "lugar"
    t.time     "hora_inicio"
    t.time     "hora_fin"
    t.string   "hora"
    t.text     "descripcion"
    t.string   "precio"
    t.string   "direccion"
    t.string   "fuente"
    t.date     "fecha_inicio"
    t.date     "fecha_fin"
    t.string   "categoria"
    t.string   "contacto"
    t.string   "pagina"
    t.float    "latitud"
    t.float    "longitud"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
