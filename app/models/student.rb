class Student < ApplicationRecord

    has_many :registrations

    #Validations
    validates :name, presence: true

    validates :cpf, presence: true
    validates :cpf, numericality: true

    validates :gender, presence: true
    validates :gender, inclusion: { in: %w(M F)}

    validates :payment, presence: true
    validates :payment, inclusion: { in: %w(Boleto Cartao)}
    # validates :payment, confirmation: { case_sensitive: false}
end
