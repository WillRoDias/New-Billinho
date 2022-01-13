class Registration < ApplicationRecord

    belongs_to :student
    belongs_to :institution
    has_many :ticket

    after_create :new_ticket

    #Validations
    validates :amount, presence: true
    validates :amount, numericality: {greater_than: 0} 

    validates :quantity_ticket, presence: true
    validates :quantity_ticket, numericality: {greater_than_or_equal_to: 1}

    validates :due_date, presence: true
    # validates :due_date, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 28}

    validates :course, presence: true

    def new_ticket

        @private_t_amount = self.amount/self.quantity_ticket

        date_aux = 1

        if due_date < Date.today
            @private_t_due_date = Date.today + 1.months
            date_aux += 1
        else
            @private_t_due_date = Date.today
        end

        
        self.quantity_ticket.times do
            Ticket.create(registration_id: self.id, t_amount: @private_t_amount, t_due_date: @private_t_due_date, t_status: "Aberta")
            @private_t_due_date = Date.today + date_aux.months
            date_aux += 1
        end
    end

end
