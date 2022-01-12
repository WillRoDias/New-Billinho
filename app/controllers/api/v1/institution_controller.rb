module Api
    module V1
        class InstitutionController < ApplicationController 
            before_action :set_institution, only: [:show, :destroy, :update]  
            def index 
                @institution_ticket = Institution.all
                render json: @institution_ticket
            end
            def show
                render json: @institution_each
            end
            def create
                @institutuin_create = Institution.new(institution_params)
                if @institutuin_create.save
                    render json: @institutuin_create, status: 201
                else
                    render json: @institutuin_create.errors, status: 422
                end
            end
            def update
                if @institution_each.update(institution_params)
                    render json: @institution_each
                else 
                    render json: @institution_each.errors, status: 422
                end
            end
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
