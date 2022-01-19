# frozen_string_literal: true

# Controller for Institution entity
# Control the access by JSON routes from postman or other application that uses JSON
# to access a database
module Api
  module V1
    class RegistrationController < ApplicationController
      # The "before_action" below allows these three functions "show destroy update"
      # to access the data from the function "set_institution"
      before_action :set_registration, only: %i[show destroy update]
      def index
        @registration_list = Registration.all
        render json: @registration_list
      end

      def show
        render json: @registration_each
      end

      def create
        @registration_create = Registration.new(registration_params)
        if @registration_create.save
          render json: @registration_create, status: 201
        else
          render json: @registration_create.errors, status: 422
        end
      end

      def update
        if @registration_each.update(registration_params)
          render json: @registration_each
        else
          render json: @registration_each.errors, status: 422
        end
      end

      def destroy
        @registration_each.destroy
      end

      private

      # Find a registry by the ID and pass to the function
      # that uses just one registry
      # These are specifyed in the "before_action" that call the function below
      # in the top of the code
      def set_registration
        @registration_each = Registration.find(params[:id])
      end

      def registration_params
        params.require(:registration).permit(:institution_id, :student_id, :amount, :quantity_ticket,
                                             :due_day, :course)
      end
    end
  end
end
