# frozen_string_literal: true

# Associations and validations of the datas
class Registration < ApplicationRecord
  # Associations
  belongs_to :student
  belongs_to :institution
  has_many :ticket, dependent: :destroy

  after_create :new_ticket

  # Validations
  validates :amount, presence: true,
                     numericality: { greater_than: 0 }

  validates :quantity_ticket, presence: true,
                              numericality: { greater_than_or_equal_to: 1 }

  validates :due_day, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 31 }

  validates :course, presence: true

  # Calculates the value of each ticket based in the value of the course
  def tickets_amount
    amount / quantity_ticket
  end

  # Create the tickets from the registrations and calculate the due date of each ticket based
  # In the day that te registrations was created and the day that the student selected to be
  # The day of the due date

  def new_ticket
    month_aux = 1

    due_date = Date.new(Date.today.year, Date.today.month, due_day)

    if due_date <= Date.today
      @private_t_due_date = due_date + 1.months
      month_aux += 1
    else
      @private_t_due_date = due_date
    end

    quantity_ticket.times do
      @private_t_due_date = if !Date.valid_date?(Date.today.year, month_aux, due_day)
                              Date.new(Date.today.year, month_aux, -1)
                            else
                              Date.new(Date.today.year, month_aux, due_day)
                            end
      Ticket.create(registration_id: id, t_amount: tickets_amount, t_due_date: @private_t_due_date,
                    t_status: 'Aberta')
      @private_t_due_date = due_date + month_aux.months
      month_aux += 1
    end
  end

  def boolean_to_integer; end
end
