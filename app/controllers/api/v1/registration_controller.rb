module Api
    module V1
        class RegistrationController < ApplicationController 
            before_action :set_registration, only: [:show, :destroy, :update]  
            #Listar todos os alunos
            def index 
                @registration_list = Registration.all
                render json: @registration_list
            end
            def show
                render json: @registration_each
            end
            #Cadastrar um novo aluno
            def create
                @registration_create = Registration.new(registration_params)
                if @registration_create.save
                    render json: @registration_create, status: 201
                else
                    render json: @registration_create.errors, status: 422
                end
            end
            #Altera uma informação no cadastro
            def update
                if @registration_each.update(registration_params)
                    render json: @registration_each
                else 
                    render json: @registration_each.errors, status: 422
                end
            end
            #Excluir um aluno
            def destroy
                @registration_each.destroy
            end
            private
            def set_registration
                @registration_each = Registration.find(params[:id])
            end
            def registration_params
                params.require(:registration).permit(:institution_id, :student_id, :amount, :quantity_ticket, :due_date, :course)
            end
        end
    end
end
