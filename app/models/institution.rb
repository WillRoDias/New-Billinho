# frozen_string_literal: true

class Institution < ApplicationRecord
  has_many :institutions

  # Validations
  validates :name, presence: true

  validates :cnpj, presence: true
  validates :cnpj, numericality: true
  validates :cnpj, length: { maximum: 14 }

  validates :i_type, inclusion: { in: %w[Universidade Escola Creche] }
  validates :i_type, presence: true # The document don't require this validation
end
