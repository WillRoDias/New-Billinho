# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Student.create(name: 'William', cpf: '224345', birth: '10/02/2001', gender: 'M', payment: 'Boleto')
Student.create(name: 'Mário', cpf: '1223545', birth: '21/10/2002', gender: 'M', payment: 'Cartao')
Student.create(name: 'Zefa', cpf: '1241513', birth: '25/02/1997', gender: 'F', payment: 'Boleto')
Student.create(name: 'Joao', cpf: '13125156', birth: '22/08/2004', gender: 'M', payment: 'Boleto')
Institution.create(name: 'UNITAU', cnpj: '1235115', i_type: 'Universidade')
Institution.create(name: 'Cultural', cnpj: '235325', i_type: 'Creche')
Institution.create(name: 'UNIP', cnpj: '55324645', i_type: 'Universidade')
Institution.create(name: 'Universal', cnpj: '12523646', i_type: 'Escola')
