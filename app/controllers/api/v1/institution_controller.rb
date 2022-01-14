# frozen_string_literal: true

# Controller for Institution entity
# Control the access by JSON routes from postman or other application that uses JSON
# to access a database
module Api
  module V1
    class InstitutionController < ApplicationController
      # The "before_action" below allows these three functions "show destroy update"
      # to access the data from the function "set_institution"
      before_action :set_institution, only: %i[show destroy update]
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

      # Find a registry by the ID and pass to the function
      # that uses just one registry
      # These are specifyed in the "before_action" that call the function below
      # in the top of the code
      def set_institution
        @institution_each = Institution.find(params[:id])
      end

      def institution_params
        params.permit(:name, :cnpj, :i_type)
      end
    end
  end
end
