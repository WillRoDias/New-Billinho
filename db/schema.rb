# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_220_111_140_700) do
  create_table 'institutions', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'cnpj', null: false
    t.string 'i_type'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['cnpj'], name: 'index_institutions_on_cnpj', unique: true
    t.index ['name'], name: 'index_institutions_on_name', unique: true
  end

  create_table 'registrations', force: :cascade do |t|
    t.integer 'student_id', null: false
    t.integer 'institution_id', null: false
    t.float 'amount', null: false
    t.integer 'quantity_ticket', null: false
    t.date 'due_date', null: false
    t.string 'course', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['institution_id'], name: 'index_registrations_on_institution_id'
    t.index ['student_id'], name: 'index_registrations_on_student_id'
  end

  create_table 'students', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'cpf', null: false
    t.date 'birth'
    t.string 'tell'
    t.string 'gender', null: false
    t.string 'payment', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['cpf'], name: 'index_students_on_cpf', unique: true
    t.index ['name'], name: 'index_students_on_name', unique: true
  end

  create_table 'tickets', force: :cascade do |t|
    t.integer 'registration_id', null: false
    t.decimal 't_amount', precision: 2, null: false
    t.date 't_due_date', null: false
    t.string 't_status', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['registration_id'], name: 'index_tickets_on_registration_id'
  end

  add_foreign_key 'registrations', 'institutions'
  add_foreign_key 'registrations', 'students'
  add_foreign_key 'tickets', 'registrations'
end
