class Institution < ApplicationRecord

    has_many :institutions

    #Validations
    validates :name, presence: true
    # validates :name, uniquiness: true

    validates :cnpj, presence: true
    validates :cnpj, numericality: true
    # validates :cnpj, uniquiness: true
    
    validates :i_type, inclusion: { in: %w(Universidade Escola Creche)}
    validates :i_type, confirmation: { case_sensitive: false}
end
