# frozen_string_literal: true

# Controller for Institution entity
# Control the access by JSON routes from postman or other application that uses JSON
# to access a database
module Api
  module V1
    class StudentController < ApplicationController
      # The "before_action" below allows these three functions "show destroy update"
      # to access the data from the function "set_institution"
      before_action :set_student, only: %i[show destroy update]
      def index
        @student_list = Student.all
        render json: @student_list
      end

      def show
        render json: @student_each
      end

      def create
        @student_create = Student.new(student_params)
        if @student_create.save
          render json: @student_create, status: 201
        else
          render json: @student_create.errors, status: 422
        end
      end

      def update
        if @student_each.update(student_params)
          render json: @student_each
        else
          render json: @student_each.errors, status: 422
        end
      end

      def destroy
        @student_each.destroy
      end

      private

      # Find a registry by the ID and pass to the function
      # that uses just one registry
      # These are specifyed in the "before_action" that call the function below
      # in the top of the code
      def set_student
        @student_each = Student.find(params[:id])
      end

      def student_params
        params.permit(:name, :cpf, :birth, :gender, :tell, :gender, :payment)
      end
    end
  end
end
