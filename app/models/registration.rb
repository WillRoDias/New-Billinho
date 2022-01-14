# frozen_string_literal: true

# Associations and validations of the datas
class Registration < ApplicationRecord
  # Associations
  belongs_to :student
  belongs_to :institution
  has_many :ticket

  after_create :new_ticket

  # Validations
  validates :amount, presence: true,
                     numericality: { greater_than: 0 }

  validates :quantity_ticket, presence: true,
                              numericality: { greater_than_or_equal_to: 1 }

  validates :due_date, presence: true
  # validates :due_date, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 28}

  validates :course, presence: true

  # Calculates the value of each ticket based in the value of the course
  def tickets_amount
    amount / quantity_ticket
  end

  def new_ticket
    date_aux = 1

    if due_date < Date.today
      @private_t_due_date = due_date + 1.months
      date_aux += 1
    else
      @private_t_due_date = due_date
    end

    quantity_ticket.times do
      Ticket.create(registration_id: id, t_amount: tickets_amount, t_due_date: @private_t_due_date,
                    t_status: 'Aberta')
      @private_t_due_date = due_date + date_aux.months
      date_aux += 1
    end
  end
end
