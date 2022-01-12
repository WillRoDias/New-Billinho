class Ticket < ApplicationRecord

    belongs_to :registration

    validates :t_amount, presence: true

    validates :t_due_date, presence: true

    validates :t_status, presence: true
    validates :t_status, inclusion: {in: %w(Aberta Atrasada Paga)}
end
