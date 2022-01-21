# frozen_string_literal: true

# Associations and validations of the datas
class Student < ApplicationRecord
  before_create :cpf_format
  # Associations
  has_many :registrations

  # Validations
  validates :name, presence: true

  validates :cpf, presence: true,
                  numericality: true

  validates :gender, presence: true,
                     inclusion: { in: %w[M F] }

  validates :payment, presence: true,
                      inclusion: { in: %w[Boleto Cartao] }
  # validates :payment, confirmation: { case_sensitive: false}
end
