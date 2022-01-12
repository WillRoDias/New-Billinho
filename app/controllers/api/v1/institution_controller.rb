module Api
    module V1
        class InstitutionController < ApplicationController 
            before_action :set_institution, only: [:show, :destroy, :update]  
            #Listar todos os alunos
            def index 
                @institution_ticket = Institution.all
                render json: @institution_ticket
            end
            def show
                render json: @institution_each
            end
            #Cadastrar um novo aluno
            def create
                @institutuin_create = Institution.new(institution_params)
                if @institutuin_create.save
                    render json: @institutuin_create, status: 201
                else
                    render json: @institutuin_create.errors, status: 422
                end
            end
            #Altera uma informação no cadastro
            def update
                if @institution_each.update(institution_params)
                    render json: @institution_each
                else 
                    render json: @institution_each.errors, status: 422
                end
            end
            #Excluir um aluno
            def destroy
                @institution_each.destroy
            end
            private
            def set_institution
                @institution_each = Institution.find(params[:id])
            end
            def institution_params
                params.permit(:name, :cnpj, :i_type)
            end
        end
    end
end
