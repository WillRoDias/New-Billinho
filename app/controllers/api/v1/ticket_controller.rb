# frozen_string_literal: true

# Controller for Institution entity
# Control the access by JSON routes from postman or other application that uses JSON
# to access a database
module Api
  module V1
    class TicketController < ApplicationController
      # The "before_action" below allows these three functions "show destroy update"
      # to access the data from the function "set_institution"
      before_action :set_ticket, only: %i[show destroy update]
      def index
        @ticket_list = Ticket.all
        render json: @ticket_list
      end

      def show
        render json: @ticket_each
      end

      def create
        @ticket_create = Ticket.new(ticket_params)
        if @ticket_create.save
          render json: @ticket_create, status: 201
        else
          render json: @ticket_create.errors, status: 422
        end
      end

      def update
        if @ticket_each.update(ticket_params)
          render json: @ticket_each
        else
          render json: @ticket_each.errors, status: 422
        end
      end

      def destroy
        @ticket_each.destroy
      end

      private

      # Find a registry by the ID and pass to the function
      # that uses just one registry
      # These are specifyed in the "before_action" that call the function below
      # in the top of the code
      def set_ticket
        @ticket_each = Ticket.find(params[:id])
      end

      def ticket_params
        params.permit(:t_amount, :t_due_date, :t_status)
      end
    end
  end
end
