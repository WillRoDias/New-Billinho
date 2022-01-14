# frozen_string_literal: true

# Associations and validations of the datas
class Ticket < ApplicationRecord
  # Associations
  belongs_to :registration

  # Validations
  validates :t_amount, presence: true

  validates :t_due_date, presence: true

  validates :t_status, presence: true,
                       inclusion: { in: %w[Aberta Atrasada Paga] }
end
