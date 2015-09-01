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

ActiveRecord::Schema.define(version: 20150901211928) do

  create_table "activo_fijos", force: :cascade do |t|
    t.date     "fecha_de_compra"
    t.integer  "gasto_id"
    t.string   "vida_util"
    t.integer  "importe",         limit: 8
    t.string   "depreciacion"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "descripcion"
  end

  add_index "activo_fijos", ["gasto_id"], name: "index_activo_fijos_on_gasto_id"

  create_table "cargos", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "departamento_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "cargos", ["departamento_id"], name: "index_cargos_on_departamento_id"

  create_table "clases", force: :cascade do |t|
    t.integer  "clase"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string   "nombre"
    t.string   "nit"
    t.string   "tipo_de_cliente"
    t.string   "contacto_comercial"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "direccion_de_facturacion"
    t.string   "cupo_de_credito"
    t.string   "contacto_facturacion"
    t.string   "telefono"
    t.integer  "colaboradore_id"
    t.string   "ciudad"
    t.string   "codigo_postal"
    t.string   "pais"
    t.integer  "users_id"
  end

  add_index "clientes", ["colaboradore_id"], name: "index_clientes_on_colaboradore_id"
  add_index "clientes", ["users_id"], name: "index_clientes_on_users_id"

  create_table "colaboradores", force: :cascade do |t|
    t.string   "nombre"
    t.string   "cargo"
    t.string   "departamento"
    t.string   "jefe_inmediato"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "cedula"
    t.string   "telefono_empresa"
    t.string   "telefono_personal"
    t.string   "direccion"
    t.integer  "user_id"
    t.integer  "departamento_id"
    t.integer  "cargo_id"
  end

  add_index "colaboradores", ["cargo_id"], name: "index_colaboradores_on_cargo_id"
  add_index "colaboradores", ["departamento_id"], name: "index_colaboradores_on_departamento_id"
  add_index "colaboradores", ["user_id"], name: "index_colaboradores_on_user_id"

  create_table "cuenta_pucs", force: :cascade do |t|
    t.integer  "cuenta"
    t.string   "descripcion"
    t.integer  "grupo_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "cuenta_pucs", ["grupo_id"], name: "index_cuenta_pucs_on_grupo_id"

  create_table "departamentos", force: :cascade do |t|
    t.string   "nombre"
    t.string   "jefe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "factura_items", force: :cascade do |t|
    t.integer  "factura_id"
    t.integer  "ordene_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.date     "fecha_orden"
    t.string   "unidad"
    t.integer  "costo_unidad",       limit: 8
    t.integer  "medio_id"
    t.boolean  "facturar"
    t.integer  "cantidad"
    t.string   "ubicacion"
    t.decimal  "descuento"
    t.integer  "iva",                limit: 8
    t.integer  "subtotal",           limit: 8
    t.boolean  "facturar_proveedor"
    t.integer  "subcuenta_puc_id"
    t.boolean  "sin_iva"
    t.integer  "presupuesto_id"
    t.integer  "valor",              limit: 8
    t.integer  "total",              limit: 8
  end

  add_index "factura_items", ["factura_id"], name: "index_factura_items_on_factura_id"
  add_index "factura_items", ["medio_id"], name: "index_factura_items_on_medio_id"
  add_index "factura_items", ["ordene_id"], name: "index_factura_items_on_ordene_id"
  add_index "factura_items", ["subcuenta_puc_id"], name: "index_factura_items_on_subcuenta_puc_id"

  create_table "factura_proveedors", force: :cascade do |t|
    t.date     "fecha_recepcion"
    t.integer  "ordene_id"
    t.integer  "proveedore_id"
    t.integer  "importe",             limit: 8
    t.boolean  "devolucion"
    t.integer  "iva",                 limit: 8
    t.date     "fecha_vencimiento"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "subcuenta_puc_id"
    t.integer  "importe_pronto_pago", limit: 8
    t.string   "numero_de_factura"
    t.integer  "pago_id"
  end

  add_index "factura_proveedors", ["ordene_id"], name: "index_factura_proveedors_on_ordene_id"
  add_index "factura_proveedors", ["pago_id"], name: "index_factura_proveedors_on_pago_id"
  add_index "factura_proveedors", ["proveedore_id"], name: "index_factura_proveedors_on_proveedore_id"
  add_index "factura_proveedors", ["subcuenta_puc_id"], name: "index_factura_proveedors_on_subcuenta_puc_id"

  create_table "facturas", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.date     "fecha_de_expedicion"
    t.date     "fecha_de_vencimiento"
    t.integer  "cliente_id"
    t.integer  "presupuesto_id"
    t.integer  "total",                limit: 8
    t.boolean  "facturar"
  end

  add_index "facturas", ["cliente_id"], name: "index_facturas_on_cliente_id"
  add_index "facturas", ["presupuesto_id"], name: "index_facturas_on_presupuesto_id"

  create_table "gastos", force: :cascade do |t|
    t.date     "fecha_recepcion"
    t.integer  "proveedore_id"
    t.integer  "importe",              limit: 8
    t.integer  "iva",                  limit: 8
    t.date     "fecha_de_vencimiento"
    t.integer  "subcuenta_puc_id"
    t.boolean  "asignar_a_cliente"
    t.integer  "cliente_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "compra_de_activo"
    t.integer  "user_id"
    t.integer  "pago_id"
  end

  add_index "gastos", ["cliente_id"], name: "index_gastos_on_cliente_id"
  add_index "gastos", ["pago_id"], name: "index_gastos_on_pago_id"
  add_index "gastos", ["proveedore_id"], name: "index_gastos_on_proveedore_id"
  add_index "gastos", ["subcuenta_puc_id"], name: "index_gastos_on_subcuenta_puc_id"
  add_index "gastos", ["user_id"], name: "index_gastos_on_user_id"

  create_table "grupos", force: :cascade do |t|
    t.integer  "grupo"
    t.string   "descripcion"
    t.integer  "clase_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "grupos", ["clase_id"], name: "index_grupos_on_clase_id"

  create_table "medios", force: :cascade do |t|
    t.string   "nombre"
    t.string   "nit"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "proveedore_id"
    t.string   "tipo_de_volumen"
    t.decimal  "escala"
    t.string   "rango"
    t.decimal  "escala2"
    t.string   "rango2"
    t.decimal  "escala3"
    t.string   "rango3"
    t.decimal  "escala4"
    t.string   "rango4"
    t.decimal  "escala5"
    t.string   "rango5"
    t.decimal  "escala6"
    t.string   "rango6"
    t.string   "cobro"
    t.integer  "presupuesto_id"
  end

  add_index "medios", ["presupuesto_id"], name: "index_medios_on_presupuesto_id"
  add_index "medios", ["proveedore_id"], name: "index_medios_on_proveedore_id"

  create_table "ordenes", force: :cascade do |t|
    t.datetime "fecha_orden"
    t.string   "unidad"
    t.integer  "costo_unidad",         limit: 8
    t.integer  "presupuesto_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "medio_id"
    t.integer  "cantidad"
    t.string   "cobertura"
    t.string   "referencia_preventa"
    t.string   "ubicacion"
    t.decimal  "descuento"
    t.string   "formato"
    t.integer  "duracion"
    t.string   "notas"
    t.integer  "cm"
    t.integer  "col"
    t.string   "franja"
    t.integer  "subtotal",             limit: 8
    t.boolean  "aprobado_por_cliente"
    t.boolean  "emision_certificada"
  end

  add_index "ordenes", ["medio_id"], name: "index_ordenes_on_medio_id"
  add_index "ordenes", ["presupuesto_id"], name: "index_ordenes_on_presupuesto_id"

  create_table "pagos", force: :cascade do |t|
    t.date     "fecha"
    t.integer  "proveedore_id"
    t.integer  "subcuenta_puc_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "importe",             limit: 8
    t.string   "forma_de_pago"
    t.boolean  "gasto"
    t.string   "banco"
    t.integer  "numero_de_cheque"
    t.boolean  "pagar"
    t.integer  "importe_pronto_pago", limit: 8
    t.integer  "total",               limit: 8
  end

  add_index "pagos", ["proveedore_id"], name: "index_pagos_on_proveedore_id"
  add_index "pagos", ["subcuenta_puc_id"], name: "index_pagos_on_subcuenta_puc_id"

  create_table "presupuestos", force: :cascade do |t|
    t.datetime "fecha"
    t.string   "titulo"
    t.string   "producto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "cliente_id"
  end

  add_index "presupuestos", ["cliente_id"], name: "index_presupuestos_on_cliente_id"

  create_table "proveedores", force: :cascade do |t|
    t.string   "nombre"
    t.string   "nit"
    t.string   "contacto_financiero"
    t.string   "contacto_comercial"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "telefono"
    t.string   "direccion"
    t.decimal  "pronto_pago"
    t.integer  "dias_pronto_pago"
    t.boolean  "gasto"
  end

  create_table "recibo_de_cajas", force: :cascade do |t|
    t.date     "fecha"
    t.integer  "importe",          limit: 8
    t.string   "concepto"
    t.string   "forma_de_pago"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "codigo_de_banco"
    t.integer  "numero_de_cheque"
    t.integer  "numero_de_cuenta"
    t.integer  "subcuenta_puc_id"
    t.integer  "factura_id"
  end

  add_index "recibo_de_cajas", ["factura_id"], name: "index_recibo_de_cajas_on_factura_id"
  add_index "recibo_de_cajas", ["subcuenta_puc_id"], name: "index_recibo_de_cajas_on_subcuenta_puc_id"

  create_table "subcuenta_pucs", force: :cascade do |t|
    t.integer  "subcuenta"
    t.string   "descripcion"
    t.integer  "CuentaPuc_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "subcuenta_pucs", ["CuentaPuc_id"], name: "index_subcuenta_pucs_on_CuentaPuc_id"

  create_table "transaccions", force: :cascade do |t|
    t.date     "fecha"
    t.integer  "cliente_id"
    t.integer  "debito",               limit: 8
    t.integer  "credito",              limit: 8
    t.integer  "presupuesto_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "descripcion"
    t.string   "nit"
    t.integer  "subcuenta_puc_id"
    t.integer  "factura_item_id"
    t.integer  "pago_id"
    t.integer  "recibo_de_caja_id"
    t.integer  "gasto_id"
    t.integer  "factura_proveedor_id"
  end

  add_index "transaccions", ["factura_item_id"], name: "index_transaccions_on_factura_item_id"
  add_index "transaccions", ["factura_proveedor_id"], name: "index_transaccions_on_factura_proveedor_id"
  add_index "transaccions", ["gasto_id"], name: "index_transaccions_on_gasto_id"
  add_index "transaccions", ["pago_id"], name: "index_transaccions_on_pago_id"
  add_index "transaccions", ["recibo_de_caja_id"], name: "index_transaccions_on_recibo_de_caja_id"
  add_index "transaccions", ["subcuenta_puc_id"], name: "index_transaccions_on_subcuenta_puc_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "volumen", force: :cascade do |t|
    t.integer  "medio_id_id"
    t.string   "tipo_de_volumen"
    t.decimal  "escala"
    t.string   "rango"
    t.string   "cobro"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "medio_id"
    t.integer  "factura_item_id"
    t.integer  "valor_volumen",   limit: 8
    t.integer  "ordene_id"
    t.integer  "factura_id"
  end

  add_index "volumen", ["factura_id"], name: "index_volumen_on_factura_id"
  add_index "volumen", ["factura_item_id"], name: "index_volumen_on_factura_item_id"
  add_index "volumen", ["medio_id"], name: "index_volumen_on_medio_id"
  add_index "volumen", ["medio_id_id"], name: "index_volumen_on_medio_id_id"

end
