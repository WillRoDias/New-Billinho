# frozen_string_literal: true

# Controller for Institution entity
# Control the access by JSON routes from postman or other application that uses JSON
# to access a database
module Api
  module V1
    class EnrollmentController < ApplicationController
      # The "before_action" below allows these three functions "show destroy update"
      # to access the data from the function "set_institution"
      before_action :set_enrollment, only: %i[show destroy update]
      def index
        @enrollment_list = Enrollment.all
        render json: @enrollment_list
      end

      def show
        render json: @enrollment_each
      end

      def create
        @enrollment_create = Enrollment.new(enrollment_params)
        if @enrollment_create.save
          render json: @enrollment_create, status: 201
        else
          render json: @enrollment_create.errors, status: 422
        end
      end

      def update
        if @enrollment_each.update(enrollment_params)
          render json: @enrollment_each
        else
          render json: @enrollment_each.errors, status: 422
        end
      end

      def destroy
        @enrollment_each.destroy
      end

      private

      # Find a registry by the ID and pass to the function
      # that uses just one registry
      # These are specifyed in the "before_action" that call the function below
      # in the top of the code
      def set_enrollment
        @enrollment_each = Enrollment.find(params[:id])
      end

      def enrollment_params
        params.require(:enrollment).permit(:institution_id, :student_id, :amount, :quantity_bill,
                                           :due_day, :course)
      end
    end
  end
end
