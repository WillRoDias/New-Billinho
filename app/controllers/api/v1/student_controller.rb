module Api
    module V1
        class StudentController < ApplicationController 
            before_action :set_student, only: [:show, :destroy, :update]  
            #Listar todos os alunos
            def index 
                @student_list = Student.all
                render json: @student_list
            end
            def show
                render json: @student_each
            end
            #Cadastrar um novo aluno
            def create
                @student_create = Student.new(student_params)
                if @student_create.save
                    render json: @student_create, status: 201
                else
                    render json: @student_create.errors, status: 422
                end
            end
            #Altera uma informação no cadastro
            def update
                if @student_each.update(student_params)
                    render json: @student_each
                else 
                    render json: @student_each.errors, status: 422
                end
            end
            #Excluir um aluno
            def destroy
                @student_each.destroy
            end
            private
            def set_student
                @student_each = Student.find(params[:id])
            end
            def student_params
                params.permit(:name, :cpf, :birth, :gender, :tell, :gender, :payment)
            end
        end
    end
end
