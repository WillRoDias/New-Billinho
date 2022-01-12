class Registration < ApplicationRecord

    belongs_to :student
    belongs_to :institution
    has_many :ticket

    validates :amount, presence: true
    validates :amount, numericality: {greater_than: 0} 

    validates :quantity_ticket, presence: true
    validates :quantity_ticket, numericality: {greater_than_or_equal_to: 1}

    validates :due_date, presence: true
    validates :due_date, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 31}

    validates :course, presence: true

end
