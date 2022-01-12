module Api
    module V1
        class TicketController < ApplicationController 
            before_action :set_ticket, only: [:show, :destroy, :update]  
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
            #Excluir um aluno
            def destroy
                @ticket_each.destroy
            end
            private
            def set_ticket
                @ticket_each = Ticket.find(params[:id])
            end
            def ticket_params
                params.permit(:t_amount, :t_due_date, :t_status)
            end
        end
    end
end
