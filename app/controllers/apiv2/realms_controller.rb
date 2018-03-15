# frozen_string_literal: true

module Apiv2
  # Realms
  class RealmsController < ApplicationController
    before_action :set_apiv2_realm, only: %i[show update destroy]

    # GET /apiv2/realms
    def index
      @apiv2_realms = Apiv2::Realm.all

      render json: @apiv2_realms
    end

    # GET /apiv2/realms/1
    def show
      render json: @apiv2_realm
    end

    # POST /apiv2/realms
    def create
      @apiv2_realm = Apiv2::Realm.new(apiv2_realm_params)

      if @apiv2_realm.save
        render json: @apiv2_realm, status: :created, location: @apiv2_realm
      else
        render json: @apiv2_realm.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /apiv2/realms/1
    def update
      if @apiv2_realm.update(apiv2_realm_params)
        render json: @apiv2_realm
      else
        render json: @apiv2_realm.errors, status: :unprocessable_entity
      end
    end

    # DELETE /apiv2/realms/1
    def destroy
      @apiv2_realm.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_apiv2_realm
      @apiv2_realm = Apiv2::Realm.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def apiv2_realm_params
      params.fetch(:apiv2_realm, {})
    end
  end
end
