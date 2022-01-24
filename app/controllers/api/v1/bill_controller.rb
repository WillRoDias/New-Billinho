# frozen_string_literal: true

# Controller for Institution entity
# Control the access by JSON routes from postman or other application that uses JSON
# to access a database
module Api
  module V1
    class BillController < ApplicationController
      # The "before_action" below allows these three functions "show destroy update"
      # to access the data from the function "set_institution"
      before_action :set_bill, only: %i[show destroy update]
      def index
        @bill_list = Bill.all
        render json: @bill_list
      end

      def show
        render json: @bill_each
      end

      def create
        @bill_create = Bill.new(bill_params)
        if @bill_create.save
          render json: @bill_create, status: 201
        else
          render json: @bill_create.errors, status: 422
        end
      end

      def update
        if @bill_each.update(bill_params)
          render json: @bill_each
        else
          render json: @bill_each.errors, status: 422
        end
      end

      def destroy
        @bill_each.destroy
      end

      private

      # Find a registry by the ID and pass to the function
      # that uses just one registry
      # These are specifyed in the "before_action" that call the function below
      # in the top of the code
      def set_bill
        @bill_each = Bill.find(params[:id])
      end

      def bill_params
        params.permit(:t_amount, :t_due_date, :t_status)
      end
    end
  end
end
